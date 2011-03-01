## TODO: ask results are just 'true' on the line, not 'expected = '
#!/usr/bin/env ruby

$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'sparql/spec/models'
require 'sparql/client'
require 'erubis'

class RDF::URI
  def to_ruby
    "RDF::URI('#{self.to_s}')"
  end
end

class RDF::Literal
  def to_ruby
    "RDF::Literal.new('#{self.to_s}' #{", :datatype => #{self.datatype.to_ruby}" unless self.datatype.nil?}#{", :language => '#{self.language.to_s}'" if self.has_language?})"
  end
end

class RDF::Node
  def to_ruby
    "RDF::Node.new('#{self.id}')"
  end
end

def results_snippet_for(test)
  case test.form
    when :ask
      ask_results_snippet(test)
    when :select
      select_results_snippet(test)
    when :describe, :construct
      describe_results_snippet(test)
  end
end

def select_results_snippet(test)
  results = if File.extname(test.result.path) == '.srx'
    SPARQL::Client.new("").parse_xml_bindings(File.read(test.result.path)).map { |result| result.to_hash }
  else
    expected_repository = RDF::Repository.new 
    Spira.add_repository!(:results, expected_repository)
    expected_repository.load(test.result.path)
    ResultBindings.each.first.solutions
  end
  template = Erubis::Eruby.new(File.read(File.join(File.dirname(__FILE__), '..', 'etc', 'bindings.rb.erb')))
  template.result(binding)
end

def ask_results_snippet(test)
  if File.extname(test.result.path) == '.srx'
    SPARQL::Client.new("").parse_xml_bindings(File.read(test.result.path))
  else
    expected_repository = RDF::Repository.new 
    Spira.add_repository!(:results, expected_repository)
    expected_repository.load(test.result.path)
    if ResultBindings.each.first.boolean.nil?
      raise "Couldn't parse ask bindings for #{test.result.path}" # just an assertion, is there another case?
    end
    "      expected = #{ResultBindings.each.first.boolean}"
  end
end

def describe_results_snippet(test)
end

def filename_for(directory, test)
  data_dir = case test.action.test_data
    when nil
      test.action.graphData.first.path
    else
      test.action.test_data.path
  end
  data_dir = File.basename(File.dirname(data_dir))
  filename = File.join( directory,
                        data_dir,
                        File.basename(test.subject.fragment)) 
  filename += '_spec.rb'
end

def load_w3c_tests
  base_directory = File.join(File.expand_path(File.dirname(__FILE__)), '..', '..', 'tests')
  if ENV['MANIFEST']
    puts "Loading tests from #{ENV['MANIFEST']}"
    test_repo = RDF::Repository.new
    Spira.add_repository(:default, test_repo)
    # I'm not sure why this is correct--why not dirname?
    base_uri = ENV['MANIFEST']
    manifest_file = ENV['MANIFEST']
    test_repo.load(manifest_file, :base_uri => base_uri, :context => ENV['MANIFEST'])
    tests = Manifest.each.map { |m| m.entries }.flatten.find_all { |t| t.approved? }
    tests.each { |test| test.update!(:manifest => ENV['MANIFEST']) }
  else
    if File.exists?('./sparql-specs-cache.nt')
      puts "Using cached manifests"
      Spira.add_repository(:default, RDF::Repository.load('./sparql-specs-cache.nt'))
      tests = Manifest.each.map { |m| m.entries }.flatten.find_all { |t| t.approved? }
    else
      puts "building manifests..."
      test_repo = RDF::Repository.new
      Spira.add_repository(:default, test_repo)
      test_repo.load("#{base_directory}/sparql11-tests/data-sparql11/manifest-all.ttl", :base_uri => "#{base_directory}/sparql11-tests/data-sparql11/")
      Manifest.each do |manifest| manifest.include_files! end
      tests = Manifest.each.map { |m| m.entries }.flatten.find_all { |t| !t.result.nil? }
      tests.each { |test|
        test.tags << 'status:unverified'
        test.tags << 'w3c_status:unapproved' unless test.approved?
        test.update!(:manifest => test.data.each_context.first)
      }
      File.open('./sparql-specs-cache.nt', 'w+') do |file|
        file.write RDF::Writer.for(:ntriples).dump(Spira.repository(:default))
      end
    end
  end
  tests
end


w3c_dir = ENV['DEST_DIR'] || File.join(File.expand_path(File.dirname(__FILE__)), '..', 'spec', 'sparql11',)

begin Dir.mkdir(w3c_dir) rescue nil end

tests = SPARQL::Spec.load_sparql1_1_tests
skipped = ssf_skipped = existed = count = 0
test_template = Erubis::Eruby.new(File.read(File.join(File.dirname(__FILE__), '..', 'etc', 'test.rb.erb')))
tests.each do |test|
  puts "generating for #{test.name} from #{test.manifest}"
  puts "generating for #{File.basename(File.dirname(test.action.query_file))}/#{File.basename(test.action.query_file)}"
  count += 1
  if test.action.test_data.nil?
    #puts "Skipped #{test.name} from #{test.manifest} for not having a data file"
    #skipped += 1
    #next
  end

  results_snippet = results_snippet_for(test)

  graphs = test.action.graphData.to_a

  filename = filename_for(w3c_dir, test)
  begin Dir.mkdir(File.dirname(filename)) rescue nil end
  query_file = test.action.query_file.path
  File.open(filename, 'w+') do |f|
    f.write test_template.result(binding)
  end
  
end

puts "skipped #{skipped} tests for not having data files, #{ssf_skipped} for not having SSF files, and there were #{count} total tests"

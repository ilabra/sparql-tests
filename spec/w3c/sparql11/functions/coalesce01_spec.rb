# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# coalesce01
# 
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2009/sparql/docs/tests/data-sparql11/bindings/
#
describe "W3C test" do
  context "bind" do
    before :all do
      @data = IO.read(File.dirname(__FILE__) + "/data-coalesce.ttl");
      @query = IO.read(File.dirname(__FILE__) + "/coalesce01.rq");
    end

    example "coalesce01", :w3c_status => 'approved' do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}


      repository = 'functions-coalesce01'
      expected = SPARQL::Client.parse_xml_bindings(IO.read(File.dirname(__FILE__) + "/coalesce01.srx")).map{|each| each.to_hash}

      sparql_query(:graphs => graphs, :query => @query,       # unordered comparison in rspec is =~
                   :repository => repository, :form => :select).should =~ expected
    end
  end
end

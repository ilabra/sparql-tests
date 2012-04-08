# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# if02
# 
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2009/sparql/docs/tests/data-sparql11/functions/
#
describe "W3C test" do
  context "functions" do
    before :all do
      @data = IO.read(File.dirname(__FILE__) + "/data2.ttl");
      @query = IO.read(File.dirname(__FILE__) + "/if02.rq");
    end

    example "if02", :w3c_status => 'approved' do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}


      repository = 'functions-if02'
      expected = SPARQL::Client.parse_xml_bindings(IO.read(File.dirname(__FILE__) + "/if02.srx")).map{|each| each.to_hash}

      sparql_query(:graphs => graphs, :query => @query,       # unordered comparison in rspec is =~
                   :repository => repository, :form => :select).should =~ expected
    end
  end
end

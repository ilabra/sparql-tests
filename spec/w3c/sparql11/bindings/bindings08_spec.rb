# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# biningsd08 - BINDINGS
# 
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2009/sparql/docs/tests/data-sparql11/bindings/
#
describe "W3C test" do
  context "bindings" do
    before :all do
      @data = IO.read(File.dirname(__FILE__) + "/data08.ttl");
      @query = IO.read(File.dirname(__FILE__) + "/bindings08.rq");
    end

    example "bindings08", :w3c_status => 'approved', :join => 'full' do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}


      repository = 'bindings-bindings08'
      expected = SPARQL::Client.parse_xml_bindings(IO.read(File.dirname(__FILE__) + "/bindings08.srx")).map{|each| each.to_hash}

      sparql_query(:graphs => graphs, :query => @query,       # unordered comparison in rspec is =~
                   :repository => repository, :form => :select).should =~ expected
    end
  end
end

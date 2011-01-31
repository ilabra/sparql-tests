# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# RDFS inference test domain
# 
# /Users/ben/Repos/datagraph/tests/tests/sparql11-tests/data-sparql11/entailment/rdfs06.rq
#
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2001/sw/DataAccess/tests/r2#rdfs06
#
# This test is approved: 
# 
#
describe "W3C test" do
  context "entailment" do
    before :all do
      @data = %q{
@prefix ex: <http://example.org/ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .

ex:a1 ex:b ex:c .
ex:b rdfs:domain ex:a2 .


}
      @query = %q{
PREFIX ex: <http://example.org/ns#>
SELECT ?x
WHERE {
  ?x ex:b ex:c .
}


}
    end

    example "RDFS inference test domain", :status => 'unverified', :w3c_status => 'unapproved' do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}


      repository = 'entailment-rdfs06'
      expected = [
          { 
              :x => RDF::URI('http://example.org/ns#a1'),
          },
          { 
              :x => RDF::URI('http://example.org/ns#a2'),
          },
      ]


      sparql_query(:graphs => graphs, :query => @query,       # unordered comparison in rspec is =~
                   :repository => repository, :form => :select).should =~ expected
    end
  end
end

# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# RDFS inference test rdfs:subPropertyOf
# 
# /Users/ben/Repos/dydra/tests/tests/sparql11-tests/data-sparql11/entailment/rdfs02.rq
#
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2001/sw/DataAccess/tests/r2#rdfs02
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

ex:a ex:b1 ex:c .
ex:b1 rdfs:subPropertyOf ex:b2 .


}
      @query = %q{
PREFIX ex: <http://example.org/ns#>
SELECT ?x
WHERE {
  ?x ex:b2 ex:c .
}


}
    end

    example "RDFS inference test rdfs:subPropertyOf", :status => 'unverified', :w3c_status => 'unapproved' do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}


      repository = 'entailment-rdfs02'
      expected = [
          { 
              :x => RDF::URI('http://example.org/ns#a'),
          },
      ]


      sparql_query(:graphs => graphs, :query => @query,       # unordered comparison in rspec is =~
                   :repository => repository, :form => :select).should =~ expected
    end
  end
end

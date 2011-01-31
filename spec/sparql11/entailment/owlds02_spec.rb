# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# OWL DS bnodes are not existentials with answer
# 
# /Users/ben/Repos/datagraph/tests/tests/sparql11-tests/data-sparql11/entailment/owlds02.rq
#
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2001/sw/DataAccess/tests/r2#owlds02
#
# This test is approved: 
# 
#
describe "W3C test" do
  context "entailment" do
    before :all do
      @data = %q{
@prefix :  <http://example.org/x/> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix owl: <http://www.w3.org/2002/07/owl#> .

 :x :p :y.
 :y rdf:type :c.
 :x :p _:y.
 _:y rdf:type :c.
 :z rdf:type _:x.

 :p rdf:type owl:ObjectProperty .

_:x rdf:type owl:Restriction.
_:x owl:onProperty :p.
_:x owl:someValuesFrom :c .

}
      @query = %q{
PREFIX     :  <http://example.org/x/>
PREFIX  rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs:  <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?x ?y
WHERE { 
?x :p ?y . 
?y rdf:type :c . 
}

}
    end

    example "OWL DS bnodes are not existentials with answer", :status => 'unverified', :w3c_status => 'unapproved' do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}


      repository = 'entailment-owlds02'
      expected = [
          { 
              :c => RDF::URI('http://example.org/x/y'),
              :x => RDF::URI('http://example.org/x/x'),
          },
          { 
              :x => RDF::URI('http://example.org/x/x'),
              :y => RDF::URI('bnode://yy'),
          },
      ]


      sparql_query(:graphs => graphs, :query => @query,       # unordered comparison in rspec is =~
                   :repository => repository, :form => :select).should =~ expected
    end
  end
end

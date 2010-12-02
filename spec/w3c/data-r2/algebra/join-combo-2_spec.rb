# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# Join operator with Graph and Union
# Tests combination of Join operator with Graph on LHS and Union on RHS
# /Users/ben/repos/datagraph/tests/tests/data-r2/algebra/join-combo-2.rq
#
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2001/sw/DataAccess/tests/r2#join-combo-2
#
# This test is approved: 
# http://lists.w3.org/Archives/Public/public-rdf-dawg/2007JulSep/att-0096/21-dawg-minutes.html
#
describe "W3C test" do
  context "algebra" do
    before :all do
      @data = %q{
@prefix   :         <http://example/> .
@prefix   rdf:      <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix xsd:        <http://www.w3.org/2001/XMLSchema#> .

:x1 :p "1"^^xsd:integer .
:x1 :r "4"^^xsd:integer .
:x2 :p "2"^^xsd:integer .
:x2 :r "10"^^xsd:integer .
:x2 :x "1"^^xsd:integer .
:x3 :q "3"^^xsd:integer .
:x3 :q "4"^^xsd:integer .
:x3 :s "1"^^xsd:integer .
:x3 :t :s .
:p a rdf:Property .
:x1 :z :p .

}
       # join-combo-graph-1.ttl
       @graph0 = %q{
@prefix : <http://example/> .
@prefix xsd:        <http://www.w3.org/2001/XMLSchema#> .

 :b :p "1"^^xsd:integer .
_:a :p "9"^^xsd:integer .

}
      @query = %q{
PREFIX :    <http://example/>

SELECT ?x ?y ?z
{ 
    GRAPH ?g { ?x ?p 1 } { ?x :p ?y } UNION { ?p a ?z }
}

}
    end

    example "Join operator with Graph and Union" do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}

      graphs[RDF::URI('join-combo-graph-1.ttl')] = { :data => @graph0, :format => :ttl }

      repository = 'algebra-join-combo-2'
      expected = [
          { 
              :x => RDF::URI('http://example/b'),
              :z => RDF::URI('http://www.w3.org/1999/02/22-rdf-syntax-ns#Property'),
          },
      ]


      sparql_query(:graphs => graphs, :query => @query,       # unordered comparison in rspec is =~
                   :repository => repository, :form => :select).should =~ expected
    end
  end
end

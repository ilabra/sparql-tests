# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# dataset-09b
# Data: default and named (bnodes) / Query: common subjects
# /Users/ben/Repos/datagraph/tests/tests/data-r2/dataset/dataset-09b.rq
#
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2001/sw/DataAccess/tests/r2#dawg-dataset-09b
#
# This test is approved: 
# http://www.w3.org/2007/10/09-dawg-minutes.html
#
describe "W3C test" do
  context "dataset" do
    before :all do
      @data = %q{
@prefix : <http://example/> .
@prefix xsd:        <http://www.w3.org/2001/XMLSchema#> .

:x :p "1"^^xsd:integer .
:a :p "9"^^xsd:integer .
@prefix : <http://example/> .
@prefix xsd:        <http://www.w3.org/2001/XMLSchema#> .

:x :q "2"^^xsd:integer .
@prefix : <http://example/> .
@prefix xsd:        <http://www.w3.org/2001/XMLSchema#> .

_:x :p "1"^^xsd:integer .
_:a :p "9"^^xsd:integer .
@prefix : <http://example/> .
@prefix xsd:        <http://www.w3.org/2001/XMLSchema#> .

_:x :q "2"^^xsd:integer .

}
       # data-g1.ttl
       @graph0 = %q{
@prefix : <http://example/> .
@prefix xsd:        <http://www.w3.org/2001/XMLSchema#> .

:x :p "1"^^xsd:integer .
:a :p "9"^^xsd:integer .

}
       # data-g2.ttl
       @graph1 = %q{
@prefix : <http://example/> .
@prefix xsd:        <http://www.w3.org/2001/XMLSchema#> .

:x :q "2"^^xsd:integer .

}
       # data-g3.ttl
       @graph2 = %q{
@prefix : <http://example/> .
@prefix xsd:        <http://www.w3.org/2001/XMLSchema#> .

_:x :p "1"^^xsd:integer .
_:a :p "9"^^xsd:integer .

}
       # data-g4.ttl
       @graph3 = %q{
@prefix : <http://example/> .
@prefix xsd:        <http://www.w3.org/2001/XMLSchema#> .

_:x :q "2"^^xsd:integer .

}
      @query = %q{
PREFIX : <http://example/> 

SELECT * 
FROM <http://example/data-g3-dup.ttl>
FROM NAMED <http://example/data-g3.ttl>{ 
   ?s ?p ?o
   GRAPH ?g { ?s ?q ?v }
}

}
    end

    example "dataset-09b" do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}

      graphs[RDF::URI('http://example/data-g1.ttl')] = { :data => @graph0, :format => :ttl }
      graphs[RDF::URI('http://example/data-g2.ttl')] = { :data => @graph1, :format => :ttl }
      graphs[RDF::URI('http://example/data-g3.ttl')] = { :data => @graph2, :format => :ttl }
      graphs[RDF::URI('http://example/data-g4.ttl')] = { :data => @graph3, :format => :ttl }

      repository = 'dataset-dawg-dataset-09b'
      expected = [
      ]


      sparql_query(:graphs => graphs, :query => @query,       # unordered comparison in rspec is =~
                   :repository => repository, :form => :select).should =~ expected
    end
  end
end

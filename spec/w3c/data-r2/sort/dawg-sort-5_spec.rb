# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# sort-5
# Sort first on untyped literals (ascending), then on datatyped (integer) literals (descending
# /Users/ben/repos/datagraph/tests/tests/data-r2/sort/query-sort-5.rq
#
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2001/sw/DataAccess/tests/r2#dawg-sort-5
#
# This test is approved: 
# http://www.w3.org/2007/06/26-dawg-minutes
#
describe "W3C test" do
  context "sort" do
    before :all do
      @data = %q{
@prefix rdf:    <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix foaf:       <http://xmlns.com/foaf/0.1/> .
@prefix ex:        <http://example.org/things#> .
@prefix xsd:        <http://www.w3.org/2001/XMLSchema#> .

_:a rdf:type foaf:Person ;
    foaf:name "Eve" ;
    ex:empId "9"^^xsd:integer .
		
_:b rdf:type foaf:Person ;
    foaf:name "Alice" ;
    ex:empId "29"^^xsd:integer .
		
_:c rdf:type foaf:Person ;
    foaf:name "Fred" ;
    ex:empId "27"^^xsd:integer .

_:e foaf:name "Bob" ;
    ex:empId "23"^^xsd:integer .

_:f foaf:name "Bob" ;
    ex:empId "30"^^xsd:integer .

}
      @query = %q{
PREFIX foaf:    <http://xmlns.com/foaf/0.1/>
PREFIX ex:      <http://example.org/things#> 

SELECT ?name ?emp
WHERE { ?x foaf:name ?name ; 
           ex:empId ?emp 
      }
ORDER BY ?name DESC(?emp)

}
    end

    example "sort-5" do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}


      repository = 'sort-dawg-sort-5'
      expected = [
          { 
              :emp => RDF::Literal.new('29' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
              :name => RDF::Literal.new('Alice' ),
          },
          { 
              :emp => RDF::Literal.new('30' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
              :name => RDF::Literal.new('Bob' ),
          },
          { 
              :emp => RDF::Literal.new('23' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
              :name => RDF::Literal.new('Bob' ),
          },
          { 
              :emp => RDF::Literal.new('9' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
              :name => RDF::Literal.new('Eve' ),
          },
          { 
              :emp => RDF::Literal.new('27' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
              :name => RDF::Literal.new('Fred' ),
          },
      ]


      sparql_query(:graphs => graphs, :query => @query,       # unordered comparison in rspec is =~
                   :repository => repository, :form => :select).should =~ expected
    end
  end
end

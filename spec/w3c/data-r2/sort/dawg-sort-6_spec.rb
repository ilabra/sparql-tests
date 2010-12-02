# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# sort-6
# Sort on mixed result of uris and literals.
# /Users/ben/repos/datagraph/tests/tests/data-r2/sort/query-sort-6.rq
#
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2001/sw/DataAccess/tests/r2#dawg-sort-6
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
    ex:address <http://example.org/eve> .
		
_:b rdf:type foaf:Person ;
    foaf:name "Alice" ;
    ex:address "Fascination Street 11" .
		
_:c rdf:type foaf:Person ;
    foaf:name "Fred" ;
    ex:address "fred@work.example" .

_:e foaf:name "Bob" ;
    ex:address <mailto:bob@work.example> .


}
      @query = %q{
PREFIX ex:      <http://example.org/things#> 

SELECT ?address
WHERE { ?x ex:address ?address }
ORDER BY ASC(?address)

}
    end

    example "sort-6" do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}


      repository = 'sort-dawg-sort-6'
      expected = [
          { 
              :address => RDF::URI('http://example.org/eve'),
          },
          { 
              :address => RDF::URI('mailto:bob@work.example'),
          },
          { 
              :address => RDF::Literal.new('Fascination Street 11' ),
          },
          { 
              :address => RDF::Literal.new('fred@work.example' ),
          },
      ]


      sparql_query(:graphs => graphs, :query => @query,       # unordered comparison in rspec is =~
                   :repository => repository, :form => :select).should =~ expected
    end
  end
end

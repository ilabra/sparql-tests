# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# dataset-07
# Data: default and named / Query: all data by UNION
# /Users/ben/Repos/datagraph/tests/tests/data-r2/dataset/dataset-07.rq
#
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2001/sw/DataAccess/tests/r2#dawg-dataset-07
#
# This test is approved: 
# http://lists.w3.org/Archives/Public/public-rdf-dawg/2007JulSep/att-0047/31-dawg-minutes
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
FROM <data-g1.ttl>
FROM NAMED <data-g2.ttl>
{ 
   { ?s ?p ?o }
  UNION
   { GRAPH ?g { ?s ?p ?o } }
}

}
    end

    example "dataset-07", :status => 'unverified' do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}

      graphs[RDF::URI('data-g1.ttl')] = { :data => @graph0, :format => :ttl }
      graphs[RDF::URI('data-g2.ttl')] = { :data => @graph1, :format => :ttl }
      graphs[RDF::URI('data-g3.ttl')] = { :data => @graph2, :format => :ttl }
      graphs[RDF::URI('data-g4.ttl')] = { :data => @graph3, :format => :ttl }

      repository = 'dataset-dawg-dataset-07'
      expected = [
          { 
              :g => RDF::URI('data-g2.ttl'),
              :o => RDF::Literal.new('2' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
              :p => RDF::URI('http://example/q'),
              :s => RDF::URI('http://example/x'),
          },
          { 
              :o => RDF::Literal.new('1' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
              :p => RDF::URI('http://example/p'),
              :s => RDF::URI('http://example/x'),
          },
          { 
              :o => RDF::Literal.new('9' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
              :p => RDF::URI('http://example/p'),
              :s => RDF::URI('http://example/a'),
          },
      ]


      sparql_query(:graphs => graphs, :query => @query,       # unordered comparison in rspec is =~
                   :repository => repository, :form => :select).should =~ expected
    end
  end
end

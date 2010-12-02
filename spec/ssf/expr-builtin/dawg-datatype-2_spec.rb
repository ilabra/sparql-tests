# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# datatype-2 : Literals with a datatype
# updated from original test case: eliminated ordering from test
# /Users/ben/repos/datagraph/tests/tests/data-r2/expr-builtin/q-datatype-2.rq
#
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2001/sw/DataAccess/tests/r2#dawg-datatype-2
#
# This test is approved: 
# http://lists.w3.org/Archives/Public/public-rdf-dawg/2007AprJun/0006
#
describe "W3C test" do
  context "expr-builtin" do
    before :all do
      @data = %q{
@prefix : <http://example/> .
@prefix  xsd:    <http://www.w3.org/2001/XMLSchema#> .

:x1 :p  "string" .
:x2 :p  "string"^^xsd:string .
:x3 :p  "string"@en .
:x4 :p  "lex"^^:unknownType .
:x5 :p  "1234"^^xsd:integer .
:x6 :p  <http://example/iri> .
:x7 :p  _:bNode .





}
      @query = %q{
(select (?x)
  (project (?x)
    (filter (!= (datatype ?v) <http://example/NotADataTypeIRI>)
      (bgp (triple ?x <http://example/p> ?v)))))

}
    end

    example "datatype-2 : Literals with a datatype" do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}


      repository = 'expr-builtin-dawg-datatype-2'
      expected = [
          { 
              :x => RDF::URI('http://example/x1'),
          },
          { 
              :x => RDF::URI('http://example/x2'),
          },
          { 
              :x => RDF::URI('http://example/x4'),
          },
          { 
              :x => RDF::URI('http://example/x5'),
          },
      ]


      sparql_query(:graphs => graphs, :query => @query,       # unordered comparison in rspec is =~
                   :repository => repository, :form => :select).should =~ expected
    end
  end
end

# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# OPTIONAL - Outer FILTER
# FILTER outside an OPTIONAL tests bound and unbound variables
# /Users/ben/repos/datagraph/tests/tests/data-r2/optional-filter/expr-2.rq
#
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2001/sw/DataAccess/tests/r2#dawg-optional-filter-002
#
# This test is approved: 
# http://lists.w3.org/Archives/Public/public-rdf-dawg/2007AprJun/att-0082/2007-06-12-dawg-minutes.html
#
describe "W3C test" do
  context "optional-filter" do
    before :all do
      @data = %q{
@prefix x: <http://example.org/ns#> .
@prefix : <http://example.org/books#> .
@prefix dc:         <http://purl.org/dc/elements/1.1/> .
@prefix xsd:        <http://www.w3.org/2001/XMLSchema#> .

:book1 dc:title "TITLE 1" .
:book1 x:price  "10"^^xsd:integer .

:book2 dc:title "TITLE 2" .
:book2 x:price  "20"^^xsd:integer .

:book3 dc:title "TITLE 3" .

}
      @query = %q{
(select (?title ?price)
        (project (?title ?price)
                 (filter (< ?price 15)
                         (leftjoin
                          (bgp (triple ?book <http://purl.org/dc/elements/1.1/title> ?title))
                          (bgp (triple ?book <http://example.org/ns#price> ?price))))))

}
    end

    example "OPTIONAL - Outer FILTER" do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}


      repository = 'optional-filter-dawg-optional-filter-002'
      expected = [
          { 
              :price => RDF::Literal.new('10' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
              :title => RDF::Literal.new('TITLE 1' ),
          },
      ]


      sparql_query(:graphs => graphs, :query => @query,       # unordered comparison in rspec is =~
                   :repository => repository, :form => :select).should =~ expected
    end
  end
end

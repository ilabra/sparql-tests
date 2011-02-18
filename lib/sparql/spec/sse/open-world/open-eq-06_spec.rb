# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# open-eq-06
# FILTER(?v != unknown type)
# /Users/ben/repos/datagraph/tests/tests/data-r2/open-world/open-eq-06.rq
#
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2001/sw/DataAccess/tests/r2#open-eq-06
#
# This test is approved: 
# http://lists.w3.org/Archives/Public/public-rdf-dawg/2007AprJun/att-0082/2007-06-12-dawg-minutes.html
#
describe "W3C test" do
  context "open-world" do
    before :all do
      @data = %q{
@prefix t: <http://example/t#> .
@prefix :  <http://example/ns#> .
@prefix xsd:    <http://www.w3.org/2001/XMLSchema#> .

:x1 :p "a"^^t:type1 .
:x2 :p "b"^^t:type1 .

:y1 :p "a"^^t:type2 .
:y2 :p "b"^^t:type2 .

:z1 :p "1"^^xsd:integer .
:z2 :p "01"^^xsd:integer .
:z3 :p "2"^^xsd:integer .
:z4 :p "02"^^xsd:integer .




}
      @query = %q{
        (prefix ((t: <http://example/t#>)
                 (: <http://example/ns#>))
          (filter (!= ?v "a"^^t:type1)
            (bgp (triple ?x :p ?v))))
}
    end

    example "open-eq-06" do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}


      repository = 'open-world-open-eq-06'
      expected = [
      ]


      sparql_query(:graphs => graphs, :query => @query,       # unordered comparison in rspec is =~
                   :repository => repository, :form => :select).should =~ expected
    end
  end
end

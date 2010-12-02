# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# Basic - List 2
# 
# /Users/ben/repos/datagraph/tests/tests/data-r2/basic/list-2.rq
#
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2001/sw/DataAccess/tests/r2#list-2
#
# This test is approved: 
# http://lists.w3.org/Archives/Public/public-rdf-dawg/2007JulSep/att-0060/2007-08-07-dawg-minutes.html
#
describe "W3C test" do
  context "basic" do
    before :all do
      @data = %q{
@prefix : <http://example.org/ns#> .
@prefix xsd:        <http://www.w3.org/2001/XMLSchema#> .


:x :list0 () .
:x :list1 ("1"^^xsd:integer) .
:x :list2 ("11"^^xsd:integer "22"^^xsd:integer) .
:x :list3 ("111"^^xsd:integer "222"^^xsd:integer "333"^^xsd:integer) .

}
      @query = %q{
(select (?p)
  (project (?p)
    (bgp
      (triple <http://example.org/ns#x> ?p ??0)
      (triple ??0 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> 1)
      (triple ??0 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil>)
    )))

}
    end

    example "Basic - List 2" do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}


      repository = 'basic-list-2'
      expected = [
          { 
              :p => RDF::URI('http://example.org/ns#list1'),
          },
      ]


      sparql_query(:graphs => graphs, :query => @query,       # unordered comparison in rspec is =~
                   :repository => repository, :form => :select).should =~ expected
    end
  end
end

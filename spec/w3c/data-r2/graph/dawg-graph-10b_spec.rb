# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# graph-10b
# Data: default and named (same data, with bnodes) / Query: common subjects
# /Users/ben/repos/datagraph/tests/tests/data-r2/graph/graph-10.rq
#
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2001/sw/DataAccess/tests/r2#dawg-graph-10b
#
# This test is approved: 
# http://www.w3.org/2007/10/09-dawg-minutes.html
#

describe "W3C test" do
  context "graph" do
    before :all do
      # data-g3.ttl
      # data-g3-dup.ttl
      @data = %q{
@prefix : <http://example/> .
@prefix xsd:        <http://www.w3.org/2001/XMLSchema#> .

_:x :p "1"^^xsd:integer .
_:a :p "9"^^xsd:integer .

@prefix : <http://example/> .
@prefix xsd:        <http://www.w3.org/2001/XMLSchema#> .

_:x :p "1"^^xsd:integer .
_:a :p "9"^^xsd:integer .

}

      @query = %q{
PREFIX : <http://example/> 

SELECT * 
{ 
   ?s ?p ?o
   GRAPH ?g { ?s ?q ?v }
}

}
    end

    example "graph-10b" do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}

      repository = 'graph-dawg-graph-10b'
      expected = [
      ]


      sparql_query(:graphs => graphs, :query => @query,       # unordered comparison in rspec is =~
                   :repository => repository, :form => :select).should =~ expected
    end
  end
end

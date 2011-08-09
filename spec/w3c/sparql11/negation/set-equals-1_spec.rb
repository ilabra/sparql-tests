# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# Calculate which sets have the same elements
# 
# /Users/ben/Repos/datagraph/tests/tests/sparql11-tests/data-sparql11/negation/set-equals-1.rq
#
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2001/sw/DataAccess/tests/r2#set-equals-1
#
# This test is approved: 
# 
#
describe "W3C test" do
  context "negation" do
    before :all do
      @data = %q{
@prefix rdf:     <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix :        <http://example/> .

:a rdf:type :Set .
:a :member 1 .
:a :member 2 .
:a :member 3 .

:b rdf:type :Set .
:b :member 1 .
:b :member 9 .

:c rdf:type :Set .
:c :member 1 .
:c :member 2 . 

:d rdf:type :Set .
:d :member 1 .
:d :member 9 .

:e rdf:type :Set .
:e :member 1 .
:e :member 2 . 

:empty rdf:type :Set .

}
      @query = %q{
PREFIX :    <http://example/>
PREFIX  rdf:    <http://www.w3.org/1999/02/22-rdf-syntax-ns#>

# Find sets that have exactly the same members.
# Find all (s1,s2) such that (s1 subset of s) and (s2 subset of s1).

SELECT DISTINCT ?s1 ?s2
WHERE
{
    # All pairs of sets (no duplicates, not reveres pairs)
    ?s2 rdf:type :Set .
    ?s1 rdf:type :Set .
    FILTER(str(?s1) < str(?s2))
    MINUS 
    {
        ?s1 rdf:type :Set .
        ?s2 rdf:type :Set .
        ?s1 :member ?x .
        FILTER NOT EXISTS { ?s2 :member ?x . }
    }
    MINUS 
    {
        ?s1 rdf:type :Set .
        ?s2 rdf:type :Set .
        ?s2 :member ?x .
        FILTER NOT EXISTS { ?s1 :member ?x . }
    }
}

}
    end

    example "Calculate which sets have the same elements", :w3c_status => 'unapproved' do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}


      repository = 'negation-set-equals-1'
      expected = [
          { 
              :s1 => RDF::URI('http://example/c'),
              :s2 => RDF::URI('http://example/e'),
          },
          { 
              :s1 => RDF::URI('http://example/b'),
              :s2 => RDF::URI('http://example/d'),
          },
      ]


      sparql_query(:graphs => graphs, :query => @query,       # unordered comparison in rspec is =~
                   :repository => repository, :form => :select).should =~ expected
    end
  end
end

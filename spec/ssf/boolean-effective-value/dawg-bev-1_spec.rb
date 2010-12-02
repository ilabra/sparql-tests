# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# Test 'boolean effective value' - true
# Non-zero numerics, non-empty strings, and the true boolean have an EBV of true
# /Users/ben/repos/datagraph/tests/tests/data-r2/boolean-effective-value/query-bev-1.rq
#
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2001/sw/DataAccess/tests/r2#dawg-bev-1
#
# This test is approved: 
# http://lists.w3.org/Archives/Public/public-rdf-dawg/2007AprJun/att-0082/2007-06-12-dawg-minutes.html
#
describe "W3C test" do
  context "boolean-effective-value" do
    before :all do
      @data = %q{
@prefix : <http://example.org/ns#> .
@prefix xsd:        <http://www.w3.org/2001/XMLSchema#> .

# These object values are true by the boolean effective value rule.
:x1 :p    "1"^^xsd:integer .
:x2 :p    "foo" .
:x3 :p    "0.01"^^xsd:double .
:x4 :p    "true"^^xsd:boolean .

# These are false
:y1 :p    "0"^^xsd:integer .
:y2 :p    "0.0"^^xsd:double .
:y3 :p    "" .
:y4 :p    "false"^^xsd:boolean .

}
      @query = %q{
(select (?a)
  (project (?a)
    (filter ?v
      (bgp (triple ?a <http://example.org/ns#p> ?v)))))

}
    end

    example "Test 'boolean effective value' - true" do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}


      repository = 'boolean-effective-value-dawg-bev-1'
      expected = [
          { 
              :a => RDF::URI('http://example.org/ns#x4'),
          },
          { 
              :a => RDF::URI('http://example.org/ns#x1'),
          },
          { 
              :a => RDF::URI('http://example.org/ns#x3'),
          },
          { 
              :a => RDF::URI('http://example.org/ns#x2'),
          },
      ]


      sparql_query(:graphs => graphs, :query => @query,       # unordered comparison in rspec is =~
                   :repository => repository, :form => :select).should =~ expected
    end
  end
end

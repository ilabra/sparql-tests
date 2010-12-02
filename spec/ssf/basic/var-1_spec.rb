# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# Basic - Var 1
# 
# /Users/ben/repos/datagraph/tests/tests/data-r2/basic/var-1.rq
#
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2001/sw/DataAccess/tests/r2#var-1
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

:x :p1 "1"^^xsd:integer .
:x :p2 "2"^^xsd:integer .

}
      @query = %q{
(select (?p ?v)
        (bgp (triple <http://example.org/ns#x> ?p ?v)))

}
    end

    example "Basic - Var 1" do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}


      repository = 'basic-var-1'
      expected = [
          { 
              :p => RDF::URI('http://example.org/ns#p2'),
              :v => RDF::Literal.new('2' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
          },
          { 
              :p => RDF::URI('http://example.org/ns#p1'),
              :v => RDF::Literal.new('1' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
          },
      ]


      sparql_query(:graphs => graphs, :query => @query,       # unordered comparison in rspec is =~
                   :repository => repository, :form => :select).should =~ expected
    end
  end
end

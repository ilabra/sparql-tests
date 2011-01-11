# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# sort-3
# Sort on (possibly unbound) URIs
# /Users/ben/repos/datagraph/tests/tests/data-r2/sort/query-sort-3.rq
#
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2001/sw/DataAccess/tests/r2#dawg-sort-3
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

_:a rdf:type foaf:Person ;
    foaf:name "Eve" ;
    foaf:mbox <mailto:eve@work.example> .
    
_:b rdf:type foaf:Person ;
    foaf:name "Alice" ;
    foaf:mbox <mailto:alice@work.example> .

_:c rdf:type foaf:Person ;
    foaf:mbox <mailto:fred@work.example> ;
    foaf:name "Fred" .

_:e foaf:name "Bob" .


}
      @query = %q{
(select (?name ?mbox)
  (project (?name ?mbox)
    (order ((asc ?mbox))
      (leftjoin
        (bgp (triple ?x <http://xmlns.com/foaf/0.1/name> ?name))
        (bgp (triple ?x <http://xmlns.com/foaf/0.1/mbox> ?mbox))))))

}
    end

    example "sort-3" do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}


      repository = 'sort-dawg-sort-3'
      expected = [
          { 
              :name => RDF::Literal.new('Bob' ),
          },
          { 
              :mbox => RDF::URI('mailto:alice@work.example'),
              :name => RDF::Literal.new('Alice' ),
          },
          { 
              :mbox => RDF::URI('mailto:eve@work.example'),
              :name => RDF::Literal.new('Eve' ),
          },
          { 
              :mbox => RDF::URI('mailto:fred@work.example'),
              :name => RDF::Literal.new('Fred' ),
          },
      ]


      sparql_query(:graphs => graphs, :query => @query,
                   :repository => repository, :form => :select).should == expected
    end
  end
end

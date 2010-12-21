# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# dawg-bnode-coreference
# Query results must maintain bnode co-references in the dataset
# /Users/ben/repos/datagraph/tests/tests/data-r2/bnode-coreference/query.rq
#
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2001/sw/DataAccess/tests/r2#dawg-bnode-coref-001
#
# This test is approved: 
# http://lists.w3.org/Archives/Public/public-rdf-dawg/2007AprJun/0006
#
# 20101218 jaa : blank_nodes indicator

describe "W3C test" do
  context "bnode-coreference" do
    before :all do
      @data = %q{
@prefix foaf:       <http://xmlns.com/foaf/0.1/> .
@prefix rdf:        <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs:	    <http://www.w3.org/2000/01/rdf-schema#> .

_:alice
    rdf:type        foaf:Person ;
    foaf:name       "Alice" ;
    foaf:mbox       <mailto:alice@work> ;
    foaf:knows      _:bob ;
    .

_:bob
    rdf:type        foaf:Person ;
    foaf:name       "Bob" ; 
    foaf:knows      _:alice ;
    foaf:mbox       <mailto:bob@work> ;
    foaf:mbox       <mailto:bob@home> ;
    .


_:eve
    rdf:type      foaf:Person ;
    foaf:name     "Eve" ; 
    foaf:knows    _:fred ;
    .

_:fred
    rdf:type      foaf:Person ;
    foaf:mbox     <mailto:fred@edu> .

}
      @query = %q{
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX  foaf:       <http://xmlns.com/foaf/0.1/>

SELECT ?x ?y
WHERE {
  ?x foaf:knows ?y .
}

}
    end

    example "dawg-bnode-coreference", :blank_nodes => 'canonical' do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}


      repository = 'bnode-coreference-dawg-bnode-coref-001'
      expected = [
          { 
              :x => RDF::Node.new('alice'),
              :y => RDF::Node.new('bob'),
          },
          { 
              :x => RDF::Node.new('bob'),
              :y => RDF::Node.new('alice'),
          },
          { 
              :x => RDF::Node.new('eve'),
              :y => RDF::Node.new('fred'),
          },
      ]


      sparql_query(:graphs => graphs, :query => @query,       # unordered comparison in rspec is =~
                   :repository => repository, :form => :select).should =~ expected
    end
  end
end

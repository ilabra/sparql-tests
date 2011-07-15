# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# Graph-specific DELETE 1 (USING)
# Test 1 for DELETE only modifying the desired graph using a USING clause to specify the active graph
# /Users/ben/Repos/dydra/tests/tests/sparql11-tests/data-sparql11/delete/delete-using-05.ru
#
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2001/sw/DataAccess/tests/r2#dawg-delete-using-05
#
# This test is approved: 
# 
#
describe "W3C test" do
  context "delete" do
    before :all do
       # http://example.org/g1
       @graph0 = %q{
@prefix : <http://example.org/> .
@prefix foaf:       <http://xmlns.com/foaf/0.1/> .

:a foaf:name "Alan" .
:a foaf:mbox "alan@example.org" .
:b foaf:name "Bob" .
:b foaf:mbox "bob@example.org" .
:a foaf:knows :b .


}
       # http://example.org/g2
       @graph1 = %q{
@prefix : <http://example.org/> .
@prefix foaf:       <http://xmlns.com/foaf/0.1/> .

:a foaf:knows :b .
:b foaf:name "Bob" .
:b foaf:mbox "bob@example.org" .
:c foaf:name "Chris" .
:c foaf:mbox "chris@example.org" .
:b foaf:knows :c .

}
       # http://example.org/g3
       @graph2 = %q{
@prefix : <http://example/> .
@prefix foaf:       <http://xmlns.com/foaf/0.1/> .

:c foaf:name "Chris" .
:c foaf:mbox "chris@example.com" .
:d foaf:name "Dan" .
:d foaf:mbox "dan@example.com" .
:c foaf:knows :d .

}
      @query = %q{
PREFIX     : <http://example.org/> 
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 

DELETE 
{
  GRAPH <http://example.org/g1> { ?s ?p ?o }
}
USING <http://example.org/g1>
WHERE 
{ 
  ?s foaf:knows :b .
  ?s ?p ?o 
}

}
    end

    example "Graph-specific DELETE 1 (USING)", :status => 'unverified', :w3c_status => 'unapproved' do
    
      graphs = {}
      graphs[:default] = nil

      graphs[RDF::URI('http://example.org/g1')] = { :data => @graph0, :format => :.ttl }
      graphs[RDF::URI('http://example.org/g2')] = { :data => @graph1, :format => :.ttl }
      graphs[RDF::URI('http://example.org/g3')] = { :data => @graph2, :format => :.ttl }

      repository = 'delete-dawg-delete-using-05'
      expected = [
          { 
            :s => RDF::URI('http://example.org/b'),
            :p => RDF::URI('http://xmlns.com/foaf/0.1/name'),
            :o => RDF::Literal.new('Bob' ),
            
          { 
            :s => RDF::URI('http://example.org/b'),
            :p => RDF::URI('http://xmlns.com/foaf/0.1/mbox'),
            :o => RDF::Literal.new('bob@example.org' ),
            
          { 
            :s => RDF::URI('http://example.org/b'),
            :p => RDF::URI('http://xmlns.com/foaf/0.1/knows'),
            :o => RDF::URI('http://example.org/c'),
            
          { 
            :s => RDF::URI('http://example.org/a'),
            :p => RDF::URI('http://xmlns.com/foaf/0.1/knows'),
            :o => RDF::URI('http://example.org/b'),
            
          { 
            :s => RDF::URI('http://example.org/c'),
            :p => RDF::URI('http://xmlns.com/foaf/0.1/name'),
            :o => RDF::Literal.new('Chris' ),
            
          { 
            :s => RDF::URI('http://example.org/c'),
            :p => RDF::URI('http://xmlns.com/foaf/0.1/mbox'),
            :o => RDF::Literal.new('chris@example.org' ),
            
          { 
            :s => RDF::URI('http://example.org/c'),
            :p => RDF::URI('http://xmlns.com/foaf/0.1/knows'),
            :o => RDF::URI('http://example.org/d'),
            
          { 
            :s => RDF::URI('http://example.org/d'),
            :p => RDF::URI('http://xmlns.com/foaf/0.1/name'),
            :o => RDF::Literal.new('Dan' ),
            
          { 
            :s => RDF::URI('http://example.org/d'),
            :p => RDF::URI('http://xmlns.com/foaf/0.1/mbox'),
            :o => RDF::Literal.new('dan@example.org' ),
            
          },
      ]


      sparql_query(:graphs => graphs, :query => @query,       # unordered comparison in rspec is =~
                   :repository => repository, :form => :update).should =~ expected
    end
  end
end

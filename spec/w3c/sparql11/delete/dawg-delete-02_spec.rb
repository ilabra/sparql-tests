# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# Simple DELETE 2
# This is a simple delete of an existing triple from a named graph
# /Users/ben/Repos/dydra/tests/tests/sparql11-tests/data-sparql11/delete/delete-02.ru
#
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2001/sw/DataAccess/tests/r2#dawg-delete-02
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
      @query = %q{
PREFIX     : <http://example.org/> 
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 

DELETE 
{
  GRAPH <http://example.org/g1> { ?s ?p ?o }
}
WHERE 
{
  GRAPH <http://example.org/g1> { :a foaf:knows ?s .
                                  ?s ?p ?o }
}

}
    end

    example "Simple DELETE 2", :status => 'unverified', :w3c_status => 'unapproved' do
    
      graphs = {}
      graphs[:default] = nil

      graphs[RDF::URI('http://example.org/g1')] = { :data => @graph0, :format => :ttl }

      repository = 'delete-dawg-delete-02'
      expected = [
          { 
            :s => RDF::URI('http://example.org/a'),
            :p => RDF::URI('http://xmlns.com/foaf/0.1/name'),
            :o => RDF::Literal.new('Alan' ),
            
          { 
            :s => RDF::URI('http://example.org/a'),
            :p => RDF::URI('http://xmlns.com/foaf/0.1/mbox'),
            :o => RDF::Literal.new('alan@example.org' ),
            
          { 
            :s => RDF::URI('http://example.org/a'),
            :p => RDF::URI('http://xmlns.com/foaf/0.1/knows'),
            :o => RDF::URI('http://example.org/b'),
            
          },
      ]


      sparql_query(:graphs => graphs, :query => @query,       # unordered comparison in rspec is =~
                   :repository => repository, :form => :update).should =~ expected
    end
  end
end

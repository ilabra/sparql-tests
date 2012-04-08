# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# Simple DELETE 7
# This is a simple delete to test that unbound variables in the DELETE clause do not act as wildcards
# /Users/ben/Repos/dydra/tests/tests/sparql11-tests/data-sparql11/delete/delete-07.ru
#
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2001/sw/DataAccess/tests/r2#dawg-delete-07
#
# This test is approved: 
# 
# 20120219 : jaa : no longer a bug, just specified as raising an error.

describe "W3C test" do
  context "delete" do
    before :all do
      @data = %q{
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
  ?s ?p ?o .
}
WHERE
{
  :a foaf:knows ?s .
}

}
    end

    example "Simple DELETE 7", :w3c_status => 'unapproved' do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}


      repository = 'delete-dawg-delete-07'
      expected = [
          {
            :s => RDF::URI('http://example.org/a'),
            :p => RDF::URI('http://xmlns.com/foaf/0.1/name'),
            :o => RDF::Literal.new('Alan' ),
            :g => nil
          },
          {
            :s => RDF::URI('http://example.org/a'),
            :p => RDF::URI('http://xmlns.com/foaf/0.1/mbox'),
            :o => RDF::Literal.new('alan@example.org' ),
            :g => nil
          },
          {
            :s => RDF::URI('http://example.org/a'),
            :p => RDF::URI('http://xmlns.com/foaf/0.1/knows'),
            :o => RDF::URI('http://example.org/b'),
            :g => nil
          },
          {
            :s => RDF::URI('http://example.org/b'),
            :p => RDF::URI('http://xmlns.com/foaf/0.1/name'),
            :o => RDF::Literal.new('Bob' ),
            :g => nil
          },
          {
            :s => RDF::URI('http://example.org/b'),
            :p => RDF::URI('http://xmlns.com/foaf/0.1/mbox'),
            :o => RDF::Literal.new('bob@example.org' ),
            :g => nil
          },
      ]


      lambda {sparql_query(:graphs => graphs, :query => @query,
                           :repository => repository, :form => :update) }.should raise_error
    end
  end
end

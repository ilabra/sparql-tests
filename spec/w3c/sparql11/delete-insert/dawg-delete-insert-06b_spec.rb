# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# DELETE INSERT 6b
# dawg-delete-insert-06 and dawg-delete-insert-06b show that the rewriting in dawg-delete-insert-05b.ru isn't equivalent to dawg-delete-insert-05.ru in case Alan doesn't know anybody.
# /Users/ben/Repos/dydra/tests/tests/sparql11-tests/data-sparql11/delete-insert/delete-insert-05b.ru
#
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2001/sw/DataAccess/tests/r2#dawg-delete-insert-06b
#
# This test is approved: 
# 
#
describe "W3C test" do
  context "delete-insert" do
    before :all do
      @data = %q{
@prefix : <http://example.org/> .
@prefix foaf:       <http://xmlns.com/foaf/0.1/> .

:a foaf:name "Alan" .
:a foaf:mbox <mailto:alan@example.org> .
:b foaf:name "Bob" .
:b foaf:mbox <mailto:bob@example.org> .
:c foaf:name "Claire" .
:c foaf:mbox <mailto:claire@example.org> .
:b foaf:knows :c .


}
      @query = %q{
PREFIX     : <http://example.org/> 
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 

DELETE 
{
  ?a foaf:knows ?Var_B .
}
INSERT
{
  ?a foaf:knows ?a .
}
WHERE
{
  { ?a foaf:name "Alan" . }
  { ?a foaf:knows ?Var_B . }
}

}
    end

    example "DELETE INSERT 6b", :status => 'unverified', :w3c_status => 'unapproved' do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}


      repository = 'delete-insert-dawg-delete-insert-06b'
      expected = [
          { 
            :s => RDF::URI('http://example.org/a'),
            :p => RDF::URI('http://xmlns.com/foaf/0.1/name'),
            :o => RDF::Literal.new('Alan' ),
            
          { 
            :s => RDF::URI('http://example.org/a'),
            :p => RDF::URI('http://xmlns.com/foaf/0.1/mbox'),
            :o => RDF::URI('mailto:alan@example.org'),
            
          { 
            :s => RDF::URI('http://example.org/b'),
            :p => RDF::URI('http://xmlns.com/foaf/0.1/name'),
            :o => RDF::Literal.new('Bob' ),
            
          { 
            :s => RDF::URI('http://example.org/b'),
            :p => RDF::URI('http://xmlns.com/foaf/0.1/mbox'),
            :o => RDF::URI('mailto:bob@example.org'),
            
          { 
            :s => RDF::URI('http://example.org/b'),
            :p => RDF::URI('http://xmlns.com/foaf/0.1/knows'),
            :o => RDF::URI('http://example.org/c'),
            
          { 
            :s => RDF::URI('http://example.org/c'),
            :p => RDF::URI('http://xmlns.com/foaf/0.1/name'),
            :o => RDF::Literal.new('Claire' ),
            
          { 
            :s => RDF::URI('http://example.org/c'),
            :p => RDF::URI('http://xmlns.com/foaf/0.1/mbox'),
            :o => RDF::URI('mailto:claire@example.org'),
            
          },
      ]


      sparql_query(:graphs => graphs, :query => @query,       # unordered comparison in rspec is =~
                   :repository => repository, :form => :update).should =~ expected
    end
  end
end

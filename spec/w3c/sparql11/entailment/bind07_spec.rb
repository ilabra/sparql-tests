# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# bind07 - BIND fixed data for OWL DL
# 
# /Users/ben/Repos/dydra/tests/tests/sparql11-tests/data-sparql11/entailment/bind07.rq
#
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2001/sw/DataAccess/tests/r2#bind07
#
# This test is approved: 
# 
#
describe "W3C test" do
  context "entailment" do
    before :all do
      @data = %q{
@prefix : <http://example.org/> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix owl: <http://www.w3.org/2002/07/owl#> .

_:a a owl:Ontology .
:p a owl:DatatypeProperty .
:s1 :p 1 .
:s2 :p 2 .
:s3 :p 3 .
:s4 :p 4 .

}
      @query = %q{
PREFIX : <http://example.org/> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>

SELECT ?s ?p ?o ?z
{
  ?s ?p ?o .
  ?p a owl:DatatypeProperty . 
  { BIND(?o+1 AS ?z) } UNION { BIND(?o+2 AS ?z) }
}

}
    end

    example "bind07 - BIND fixed data for OWL DL", :w3c_status => 'unapproved' do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}


      repository = 'entailment-bind07'
      expected = [
          { 
              :o => RDF::Literal.new('4' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
              :p => RDF::URI('http://example.org/p'),
              :s => RDF::URI('http://example.org/s4'),
          },
          { 
              :o => RDF::Literal.new('4' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
              :p => RDF::URI('http://example.org/p'),
              :s => RDF::URI('http://example.org/s4'),
          },
          { 
              :o => RDF::Literal.new('3' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
              :p => RDF::URI('http://example.org/p'),
              :s => RDF::URI('http://example.org/s3'),
          },
          { 
              :o => RDF::Literal.new('3' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
              :p => RDF::URI('http://example.org/p'),
              :s => RDF::URI('http://example.org/s3'),
          },
          { 
              :o => RDF::Literal.new('2' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
              :p => RDF::URI('http://example.org/p'),
              :s => RDF::URI('http://example.org/s2'),
          },
          { 
              :o => RDF::Literal.new('2' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
              :p => RDF::URI('http://example.org/p'),
              :s => RDF::URI('http://example.org/s2'),
          },
          { 
              :o => RDF::Literal.new('1' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
              :p => RDF::URI('http://example.org/p'),
              :s => RDF::URI('http://example.org/s1'),
          },
          { 
              :o => RDF::Literal.new('1' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
              :p => RDF::URI('http://example.org/p'),
              :s => RDF::URI('http://example.org/s1'),
          },
      ]


      sparql_query(:graphs => graphs, :query => @query,       # unordered comparison in rspec is =~
                   :repository => repository, :form => :select).should =~ expected
    end
  end
end

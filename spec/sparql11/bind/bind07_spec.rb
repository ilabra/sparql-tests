# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# bind07 - BIND
# 
# /Users/ben/Repos/datagraph/tests/tests/sparql11-tests/data-sparql11/bind/bind07.rq
#
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2001/sw/DataAccess/tests/r2#bind07
#
# This test is approved: 
# 
#
describe "W3C test" do
  context "bind" do
    before :all do
      @data = %q{
@prefix : <http://example.org/> .

:s1 :p 1 .
:s2 :p 2 .
:s3 :p 3 .
:s4 :p 4 .

}
      @query = %q{
PREFIX : <http://example.org/> 

SELECT ?s ?p ?o ?z
{
  ?s ?p ?o .
  { BIND(?o+1 AS ?z) } UNION { BIND(?o+2 AS ?z) }
}

}
    end

    example "bind07 - BIND", :status => 'unverified', :w3c_status => 'unapproved' do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}


      repository = 'bind-bind07'
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

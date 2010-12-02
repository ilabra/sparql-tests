# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# Nested Optionals - 2
# OPTIONALs parse in a left-associative manner
# /Users/ben/repos/datagraph/tests/tests/data-r2/algebra/two-nested-opt-alt.rq
#
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2001/sw/DataAccess/tests/r2#nested-opt-2
#
# This test is approved: 
# http://www.w3.org/2007/06/19-dawg-minutes.html
#
describe "W3C test" do
  context "algebra" do
    before :all do
      @data = %q{
@prefix   :         <http://example/> .
@prefix xsd:        <http://www.w3.org/2001/XMLSchema#> .

:x1 :p "1"^^xsd:integer .
:x2 :p "2"^^xsd:integer .
:x3 :q "3"^^xsd:integer .
:x3 :q "4"^^xsd:integer .

}
      @query = %q{
PREFIX :    <http://example/>

## The nested optional example, rewritten to a form that is the same
## for the SPARQL algebra and the declarative semantics.
SELECT *
{ 
    :x1 :p ?v .
    OPTIONAL { :x3 :q ?w }
    OPTIONAL { :x3 :q ?w  . :x2 :p ?v }
}

}
    end

    example "Nested Optionals - 2" do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}


      repository = 'algebra-nested-opt-2'
      expected = [
          { 
              :v => RDF::Literal.new('1' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
              :w => RDF::Literal.new('4' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
          },
          { 
              :v => RDF::Literal.new('1' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
              :w => RDF::Literal.new('3' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
          },
      ]


      sparql_query(:graphs => graphs, :query => @query,       # unordered comparison in rspec is =~
                   :repository => repository, :form => :select).should =~ expected
    end
  end
end

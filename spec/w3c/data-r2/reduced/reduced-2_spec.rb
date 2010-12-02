# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# SELECT REDUCED ?x with strings
# 
# /Users/ben/repos/datagraph/tests/tests/data-r2/reduced/reduced-2.rq
#
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2001/sw/DataAccess/tests/r2#reduced-2
#
# This test is approved: 
# http://lists.w3.org/Archives/Public/public-rdf-dawg/2007OctDec/att-0069/13-dawg-minutes.html
#
describe "W3C test" do
  context "reduced" do
    before :all do
      @data = %q{
@prefix :         <http://example/> .
@prefix xsd:      <http://www.w3.org/2001/XMLSchema#> .

:x1 :p "abc" .
:x1 :q "abc" .

:x2 :p "abc"@en .
:x2 :q "abc"@en .

:x3 :p "ABC" .
:x3 :q "ABC" .

:x4 :p "ABC"@en .
:x4 :q "ABC"@en .


:x5 :p "abc"^^xsd:string .
:x5 :q "abc"^^xsd:string .
:x6 :p "ABC"^^xsd:string .
:x6 :q "ABC"^^xsd:string .

:x7 :p "" .
:x7 :q "" .

:x8 :p ""@en .
:x8 :q ""@en .

:x9 :p ""^^xsd:string .
:x9 :q ""^^xsd:string .

}
      @query = %q{
PREFIX :      <http://example/> 
PREFIX xsd:   <http://www.w3.org/2001/XMLSchema#>

SELECT REDUCED ?v
{
    ?x ?p ?v .
}

}
    end

    example "SELECT REDUCED ?x with strings" do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}


      repository = 'reduced-reduced-2'
      expected = [
          { 
              :v => RDF::Literal.new('ABC' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#string')),
          },
          { 
              :v => RDF::Literal.new('ABC' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#string')),
          },
          { 
              :v => RDF::Literal.new('abc' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#string')),
          },
          { 
              :v => RDF::Literal.new('abc' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#string')),
          },
          { 
              :v => RDF::Literal.new('ABC' ),
          },
          { 
              :v => RDF::Literal.new('ABC' ),
          },
          { 
              :v => RDF::Literal.new('ABC' ),
          },
          { 
              :v => RDF::Literal.new('ABC' ),
          },
          { 
              :v => RDF::Literal.new('' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#string')),
          },
          { 
              :v => RDF::Literal.new('' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#string')),
          },
          { 
              :v => RDF::Literal.new('abc' ),
          },
          { 
              :v => RDF::Literal.new('abc' ),
          },
          { 
              :v => RDF::Literal.new('' ),
          },
          { 
              :v => RDF::Literal.new('' ),
          },
          { 
              :v => RDF::Literal.new('abc' ),
          },
          { 
              :v => RDF::Literal.new('abc' ),
          },
          { 
              :v => RDF::Literal.new('' ),
          },
          { 
              :v => RDF::Literal.new('' ),
          },
      ]


      sparql_query(:graphs => graphs, :query => @query,       # unordered comparison in rspec is =~
                   :repository => repository, :form => :select).should =~ expected
    end
  end
end

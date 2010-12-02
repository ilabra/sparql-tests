# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# open-eq-11
# test of '=' || '!='
# /Users/ben/repos/datagraph/tests/tests/data-r2/open-world/open-eq-11.rq
#
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2001/sw/DataAccess/tests/r2#open-eq-11
#
# This test is approved: 
# http://lists.w3.org/Archives/Public/public-rdf-dawg/2007AprJun/att-0082/2007-06-12-dawg-minutes.html
#
describe "W3C test" do
  context "open-world" do
    before :all do
      @data = %q{
@prefix     : <http://example/> .
@prefix  xsd:    <http://www.w3.org/2001/XMLSchema#> .

:x1 :p "xyz" .
:x2 :p "xyz"@en .
:x3 :p "xyz"@EN .
:x4 :p "xyz"^^xsd:string .
:x5 :p "xyz"^^xsd:integer .
:x6 :p "xyz"^^:unknown .
:x7 :p _:xyz .
:x8 :p :xyz .

:y1 :q "abc" .
:y2 :q "abc"@en .
:y3 :q "abc"@EN .
:y4 :q "abc"^^xsd:string .
:y5 :q "abc"^^xsd:integer .
:y6 :q "abc"^^:unknown .
:y7 :q _:abc .
:y8 :q :abc .

}
      @query = %q{
PREFIX     :    <http://example/>
PREFIX  xsd:    <http://www.w3.org/2001/XMLSchema#>

SELECT *
{
    ?x :p ?v1 .
    ?y :q ?v2 .
    FILTER ( ?v1 != ?v2 || ?v1 = ?v2 )
}

}
    end

    example "open-eq-11" do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}


      repository = 'open-world-open-eq-11'
      expected = [
          { 
              :v1 => RDF::Literal.new('xyz' ),
              :v2 => RDF::Literal.new('abc' ),
              :x => RDF::URI('http://example/x1'),
              :y => RDF::URI('http://example/y1'),
          },
          { 
              :v1 => RDF::Literal.new('xyz' ),
              :v2 => RDF::Literal.new('abc' ),
              :x => RDF::URI('http://example/x1'),
              :y => RDF::URI('http://example/y2'),
          },
          { 
              :v1 => RDF::Literal.new('xyz' ),
              :v2 => RDF::Literal.new('abc' ),
              :x => RDF::URI('http://example/x1'),
              :y => RDF::URI('http://example/y3'),
          },
          { 
              :v1 => RDF::Literal.new('xyz' ),
              :v2 => RDF::Literal.new('abc' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#string')),
              :x => RDF::URI('http://example/x1'),
              :y => RDF::URI('http://example/y4'),
          },
          { 
              :v1 => RDF::Literal.new('xyz' ),
              :v2 => RDF::Node.new('b0'),
              :x => RDF::URI('http://example/x1'),
              :y => RDF::URI('http://example/y7'),
          },
          { 
              :v1 => RDF::Literal.new('xyz' ),
              :v2 => RDF::URI('http://example/abc'),
              :x => RDF::URI('http://example/x1'),
              :y => RDF::URI('http://example/y8'),
          },
          { 
              :v1 => RDF::Literal.new('xyz' ),
              :v2 => RDF::Literal.new('abc' ),
              :x => RDF::URI('http://example/x2'),
              :y => RDF::URI('http://example/y1'),
          },
          { 
              :v1 => RDF::Literal.new('xyz' ),
              :v2 => RDF::Literal.new('abc' ),
              :x => RDF::URI('http://example/x2'),
              :y => RDF::URI('http://example/y2'),
          },
          { 
              :v1 => RDF::Literal.new('xyz' ),
              :v2 => RDF::Literal.new('abc' ),
              :x => RDF::URI('http://example/x2'),
              :y => RDF::URI('http://example/y3'),
          },
          { 
              :v1 => RDF::Literal.new('xyz' ),
              :v2 => RDF::Literal.new('abc' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#string')),
              :x => RDF::URI('http://example/x2'),
              :y => RDF::URI('http://example/y4'),
          },
          { 
              :v1 => RDF::Literal.new('xyz' ),
              :v2 => RDF::Literal.new('abc' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
              :x => RDF::URI('http://example/x2'),
              :y => RDF::URI('http://example/y5'),
          },
          { 
              :v1 => RDF::Literal.new('xyz' ),
              :v2 => RDF::Literal.new('abc' , :datatype => RDF::URI('http://example/unknown')),
              :x => RDF::URI('http://example/x2'),
              :y => RDF::URI('http://example/y6'),
          },
          { 
              :v1 => RDF::Literal.new('xyz' ),
              :v2 => RDF::Node.new('b0'),
              :x => RDF::URI('http://example/x2'),
              :y => RDF::URI('http://example/y7'),
          },
          { 
              :v1 => RDF::Literal.new('xyz' ),
              :v2 => RDF::URI('http://example/abc'),
              :x => RDF::URI('http://example/x2'),
              :y => RDF::URI('http://example/y8'),
          },
          { 
              :v1 => RDF::Literal.new('xyz' ),
              :v2 => RDF::Literal.new('abc' ),
              :x => RDF::URI('http://example/x3'),
              :y => RDF::URI('http://example/y1'),
          },
          { 
              :v1 => RDF::Literal.new('xyz' ),
              :v2 => RDF::Literal.new('abc' ),
              :x => RDF::URI('http://example/x3'),
              :y => RDF::URI('http://example/y2'),
          },
          { 
              :v1 => RDF::Literal.new('xyz' ),
              :v2 => RDF::Literal.new('abc' ),
              :x => RDF::URI('http://example/x3'),
              :y => RDF::URI('http://example/y3'),
          },
          { 
              :v1 => RDF::Literal.new('xyz' ),
              :v2 => RDF::Literal.new('abc' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#string')),
              :x => RDF::URI('http://example/x3'),
              :y => RDF::URI('http://example/y4'),
          },
          { 
              :v1 => RDF::Literal.new('xyz' ),
              :v2 => RDF::Literal.new('abc' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
              :x => RDF::URI('http://example/x3'),
              :y => RDF::URI('http://example/y5'),
          },
          { 
              :v1 => RDF::Literal.new('xyz' ),
              :v2 => RDF::Literal.new('abc' , :datatype => RDF::URI('http://example/unknown')),
              :x => RDF::URI('http://example/x3'),
              :y => RDF::URI('http://example/y6'),
          },
          { 
              :v1 => RDF::Literal.new('xyz' ),
              :v2 => RDF::Node.new('b0'),
              :x => RDF::URI('http://example/x3'),
              :y => RDF::URI('http://example/y7'),
          },
          { 
              :v1 => RDF::Literal.new('xyz' ),
              :v2 => RDF::URI('http://example/abc'),
              :x => RDF::URI('http://example/x3'),
              :y => RDF::URI('http://example/y8'),
          },
          { 
              :v1 => RDF::Literal.new('xyz' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#string')),
              :v2 => RDF::Literal.new('abc' ),
              :x => RDF::URI('http://example/x4'),
              :y => RDF::URI('http://example/y1'),
          },
          { 
              :v1 => RDF::Literal.new('xyz' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#string')),
              :v2 => RDF::Literal.new('abc' ),
              :x => RDF::URI('http://example/x4'),
              :y => RDF::URI('http://example/y2'),
          },
          { 
              :v1 => RDF::Literal.new('xyz' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#string')),
              :v2 => RDF::Literal.new('abc' ),
              :x => RDF::URI('http://example/x4'),
              :y => RDF::URI('http://example/y3'),
          },
          { 
              :v1 => RDF::Literal.new('xyz' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#string')),
              :v2 => RDF::Literal.new('abc' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#string')),
              :x => RDF::URI('http://example/x4'),
              :y => RDF::URI('http://example/y4'),
          },
          { 
              :v1 => RDF::Literal.new('xyz' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#string')),
              :v2 => RDF::Node.new('b0'),
              :x => RDF::URI('http://example/x4'),
              :y => RDF::URI('http://example/y7'),
          },
          { 
              :v1 => RDF::Literal.new('xyz' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#string')),
              :v2 => RDF::URI('http://example/abc'),
              :x => RDF::URI('http://example/x4'),
              :y => RDF::URI('http://example/y8'),
          },
          { 
              :v1 => RDF::Literal.new('xyz' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
              :v2 => RDF::Literal.new('abc' ),
              :x => RDF::URI('http://example/x5'),
              :y => RDF::URI('http://example/y2'),
          },
          { 
              :v1 => RDF::Literal.new('xyz' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
              :v2 => RDF::Literal.new('abc' ),
              :x => RDF::URI('http://example/x5'),
              :y => RDF::URI('http://example/y3'),
          },
          { 
              :v1 => RDF::Literal.new('xyz' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
              :v2 => RDF::Node.new('b0'),
              :x => RDF::URI('http://example/x5'),
              :y => RDF::URI('http://example/y7'),
          },
          { 
              :v1 => RDF::Literal.new('xyz' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
              :v2 => RDF::URI('http://example/abc'),
              :x => RDF::URI('http://example/x5'),
              :y => RDF::URI('http://example/y8'),
          },
          { 
              :v1 => RDF::Literal.new('xyz' , :datatype => RDF::URI('http://example/unknown')),
              :v2 => RDF::Literal.new('abc' ),
              :x => RDF::URI('http://example/x6'),
              :y => RDF::URI('http://example/y2'),
          },
          { 
              :v1 => RDF::Literal.new('xyz' , :datatype => RDF::URI('http://example/unknown')),
              :v2 => RDF::Literal.new('abc' ),
              :x => RDF::URI('http://example/x6'),
              :y => RDF::URI('http://example/y3'),
          },
          { 
              :v1 => RDF::Literal.new('xyz' , :datatype => RDF::URI('http://example/unknown')),
              :v2 => RDF::Node.new('b0'),
              :x => RDF::URI('http://example/x6'),
              :y => RDF::URI('http://example/y7'),
          },
          { 
              :v1 => RDF::Literal.new('xyz' , :datatype => RDF::URI('http://example/unknown')),
              :v2 => RDF::URI('http://example/abc'),
              :x => RDF::URI('http://example/x6'),
              :y => RDF::URI('http://example/y8'),
          },
          { 
              :v1 => RDF::Node.new('b1'),
              :v2 => RDF::Literal.new('abc' ),
              :x => RDF::URI('http://example/x7'),
              :y => RDF::URI('http://example/y1'),
          },
          { 
              :v1 => RDF::Node.new('b1'),
              :v2 => RDF::Literal.new('abc' ),
              :x => RDF::URI('http://example/x7'),
              :y => RDF::URI('http://example/y2'),
          },
          { 
              :v1 => RDF::Node.new('b1'),
              :v2 => RDF::Literal.new('abc' ),
              :x => RDF::URI('http://example/x7'),
              :y => RDF::URI('http://example/y3'),
          },
          { 
              :v1 => RDF::Node.new('b1'),
              :v2 => RDF::Literal.new('abc' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#string')),
              :x => RDF::URI('http://example/x7'),
              :y => RDF::URI('http://example/y4'),
          },
          { 
              :v1 => RDF::Node.new('b1'),
              :v2 => RDF::Literal.new('abc' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
              :x => RDF::URI('http://example/x7'),
              :y => RDF::URI('http://example/y5'),
          },
          { 
              :v1 => RDF::Node.new('b1'),
              :v2 => RDF::Literal.new('abc' , :datatype => RDF::URI('http://example/unknown')),
              :x => RDF::URI('http://example/x7'),
              :y => RDF::URI('http://example/y6'),
          },
          { 
              :v1 => RDF::Node.new('b1'),
              :v2 => RDF::Node.new('b0'),
              :x => RDF::URI('http://example/x7'),
              :y => RDF::URI('http://example/y7'),
          },
          { 
              :v1 => RDF::Node.new('b1'),
              :v2 => RDF::URI('http://example/abc'),
              :x => RDF::URI('http://example/x7'),
              :y => RDF::URI('http://example/y8'),
          },
          { 
              :v1 => RDF::URI('http://example/xyz'),
              :v2 => RDF::Literal.new('abc' ),
              :x => RDF::URI('http://example/x8'),
              :y => RDF::URI('http://example/y1'),
          },
          { 
              :v1 => RDF::URI('http://example/xyz'),
              :v2 => RDF::Literal.new('abc' ),
              :x => RDF::URI('http://example/x8'),
              :y => RDF::URI('http://example/y2'),
          },
          { 
              :v1 => RDF::URI('http://example/xyz'),
              :v2 => RDF::Literal.new('abc' ),
              :x => RDF::URI('http://example/x8'),
              :y => RDF::URI('http://example/y3'),
          },
          { 
              :v1 => RDF::URI('http://example/xyz'),
              :v2 => RDF::Literal.new('abc' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#string')),
              :x => RDF::URI('http://example/x8'),
              :y => RDF::URI('http://example/y4'),
          },
          { 
              :v1 => RDF::URI('http://example/xyz'),
              :v2 => RDF::Literal.new('abc' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
              :x => RDF::URI('http://example/x8'),
              :y => RDF::URI('http://example/y5'),
          },
          { 
              :v1 => RDF::URI('http://example/xyz'),
              :v2 => RDF::Literal.new('abc' , :datatype => RDF::URI('http://example/unknown')),
              :x => RDF::URI('http://example/x8'),
              :y => RDF::URI('http://example/y6'),
          },
          { 
              :v1 => RDF::URI('http://example/xyz'),
              :v2 => RDF::Node.new('b0'),
              :x => RDF::URI('http://example/x8'),
              :y => RDF::URI('http://example/y7'),
          },
          { 
              :v1 => RDF::URI('http://example/xyz'),
              :v2 => RDF::URI('http://example/abc'),
              :x => RDF::URI('http://example/x8'),
              :y => RDF::URI('http://example/y8'),
          },
      ]


      sparql_query(:graphs => graphs, :query => @query,       # unordered comparison in rspec is =~
                   :repository => repository, :form => :select).should =~ expected
    end
  end
end

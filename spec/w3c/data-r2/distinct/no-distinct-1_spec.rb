# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# Numbers: No distinct
# 
# /Users/ben/repos/datagraph/tests/tests/data-r2/distinct/no-distinct-1.rq
#
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2001/sw/DataAccess/tests/r2#no-distinct-1
#
# This test is approved: 
# http://www.w3.org/2007/07/17-dawg-minutes
#
describe "W3C test" do
  context "distinct" do
    before :all do
      @data = %q{
@prefix :         <http://example/> .
@prefix xsd:      <http://www.w3.org/2001/XMLSchema#> .

:x1 :p1 "1"^^xsd:integer .
:x1 :p2 "1"^^xsd:integer .

:x2 :p1 "1"^^xsd:integer .
:x2 :p2 "1"^^xsd:integer .

:x3 :p1 "01"^^xsd:integer .
:x3 :p2 "01"^^xsd:integer .

:x4 :p1 "+1"^^xsd:integer .
:x4 :p2 "+1"^^xsd:integer .

:y1 :p1 "1.0"^^xsd:decimal .
:y1 :p2 "1.0"^^xsd:decimal .

:y2 :p1 "+1.0"^^xsd:decimal .
:y2 :p2 "+1.0"^^xsd:decimal .

:y3 :p1 "01.0"^^xsd:decimal .
:y3 :p2 "01.0"^^xsd:decimal .

:z1 :p1 "1.0e0"^^xsd:double .
:z1 :p2 "1.0e0"^^xsd:double .

:z2 :p1 "1.0e0"^^xsd:double .
:z2 :p2 "1.0e0"^^xsd:double .

:z3 :p1 "1.3e0"^^xsd:double .
:z3 :p2 "1.3e0"^^xsd:double .

:z4 :p1 "1.3e0"^^xsd:double .
:z5 :p1 "1.3e0"^^xsd:float .

}
      @query = %q{
SELECT ?v
{
    ?x ?p ?v .
}

}
    end

    example "Numbers: No distinct" do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}


      repository = 'distinct-no-distinct-1'
      expected = [
          { 
              :v => RDF::Literal.new('1.3e0' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#float')),
          },
          { 
              :v => RDF::Literal.new('1.3e0' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#double')),
          },
          { 
              :v => RDF::Literal.new('+1' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
          },
          { 
              :v => RDF::Literal.new('+1' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
          },
          { 
              :v => RDF::Literal.new('1.3e0' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#double')),
          },
          { 
              :v => RDF::Literal.new('1.3e0' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#double')),
          },
          { 
              :v => RDF::Literal.new('01.0' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#decimal')),
          },
          { 
              :v => RDF::Literal.new('01.0' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#decimal')),
          },
          { 
              :v => RDF::Literal.new('01' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
          },
          { 
              :v => RDF::Literal.new('01' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
          },
          { 
              :v => RDF::Literal.new('1.0e0' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#double')),
          },
          { 
              :v => RDF::Literal.new('1.0e0' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#double')),
          },
          { 
              :v => RDF::Literal.new('+1.0' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#decimal')),
          },
          { 
              :v => RDF::Literal.new('+1.0' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#decimal')),
          },
          { 
              :v => RDF::Literal.new('1' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
          },
          { 
              :v => RDF::Literal.new('1' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
          },
          { 
              :v => RDF::Literal.new('1.0e0' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#double')),
          },
          { 
              :v => RDF::Literal.new('1.0e0' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#double')),
          },
          { 
              :v => RDF::Literal.new('1.0' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#decimal')),
          },
          { 
              :v => RDF::Literal.new('1.0' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#decimal')),
          },
          { 
              :v => RDF::Literal.new('1' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
          },
          { 
              :v => RDF::Literal.new('1' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
          },
      ]


      sparql_query(:graphs => graphs, :query => @query,       # unordered comparison in rspec is =~
                   :repository => repository, :form => :select).should =~ expected
    end
  end
end

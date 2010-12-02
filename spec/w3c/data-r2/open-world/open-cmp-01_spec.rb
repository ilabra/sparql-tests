# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# open-cmp-01
# Find things that compare with < or >
# /Users/ben/repos/datagraph/tests/tests/data-r2/open-world/open-cmp-01.rq
#
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2001/sw/DataAccess/tests/r2#open-cmp-01
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



:x1 :p [ :v1 "v1" ; :v2 "v2" ] .

:x2 :p [ :v1 "1"^^xsd:integer ; :v2 "v2" ] .

:x3 :p [ :v1 "x"^^:unknown ; :v2 "x"^^:unknown ] .

:x4 :p [ :v1 <test:abc> ; :v2 <test:abc> ] .

:x5 :p [ :v1 "2006-08-23T09:00:00+01:00"^^xsd:dateTime ;
         :v2 "2006-08-22"^^xsd:date ].

}
      @query = %q{
PREFIX      :    <http://example/> 
PREFIX  xsd:    <http://www.w3.org/2001/XMLSchema#>

SELECT ?x ?v1 ?v2
{
    ?x :p [ :v1 ?v1 ; :v2 ?v2 ] .
    FILTER ( ?v1 < ?v2 || ?v1 > ?v2 )
}

}
    end

    example "open-cmp-01" do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}


      repository = 'open-world-open-cmp-01'
      expected = [
          { 
              :v1 => RDF::Literal.new('v1' ),
              :v2 => RDF::Literal.new('v2' ),
              :x => RDF::URI('http://example/x1'),
          },
      ]


      sparql_query(:graphs => graphs, :query => @query,       # unordered comparison in rspec is =~
                   :repository => repository, :form => :select).should =~ expected
    end
  end
end

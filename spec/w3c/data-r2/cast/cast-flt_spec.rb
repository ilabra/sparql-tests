# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# Cast to xsd:float
# 
# /Users/ben/repos/datagraph/tests/tests/data-r2/cast/cast-flt.rq
#
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2001/sw/DataAccess/tests/r2#cast-flt
#
# This test is approved: 
# http://lists.w3.org/Archives/Public/public-rdf-dawg/2007JulSep/att-0087/14-dawg-minutes.html
#
describe "W3C test" do
  context "cast" do
    before :all do
      @data = %q{
@prefix : <http://example.org/> .

:iri :p :z .
:str :p "string" .
:fltdbl :p "-10.2E3" .
:decimal :p "+33.3300" .
:int :p "13" .
:dT :p "2002-10-10T17:00:00Z" .
:bool :p "true" .

}
      @query = %q{
PREFIX : <http://example.org/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
SELECT ?s WHERE {
    ?s :p ?v .
    FILTER(datatype(xsd:float(?v)) = xsd:float) .
}

}
    end

    example "Cast to xsd:float" do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}


      repository = 'cast-cast-flt'
      expected = [
          { 
              :s => RDF::URI('http://example.org/fltdbl'),
          },
          { 
              :s => RDF::URI('http://example.org/decimal'),
          },
          { 
              :s => RDF::URI('http://example.org/int'),
          },
      ]


      sparql_query(:graphs => graphs, :query => @query,       # unordered comparison in rspec is =~
                   :repository => repository, :form => :select).should =~ expected
    end
  end
end

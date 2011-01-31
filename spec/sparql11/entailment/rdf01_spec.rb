# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# RDF inference test
# 
# /Users/ben/Repos/datagraph/tests/tests/sparql11-tests/data-sparql11/entailment/rdf01.rq
#
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2001/sw/DataAccess/tests/r2#rdf01
#
# This test is approved: 
# 
#
describe "W3C test" do
  context "entailment" do
    before :all do
      @data = %q{
@prefix ex: <http://example.org/ns#> .

ex:a ex:b ex:c .



}
      @query = %q{
PREFIX ex: <http://example.org/ns#>
SELECT ?x
WHERE {
  ex:b ?x rdf:Property .
}


}
    end

    example "RDF inference test", :status => 'unverified', :w3c_status => 'unapproved' do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}


      repository = 'entailment-rdf01'
      expected = [
          { 
              :x => RDF::URI('http://www.w3.org/1999/02/22-rdf-syntax-ns#type'),
          },
      ]


      sparql_query(:graphs => graphs, :query => @query,       # unordered comparison in rspec is =~
                   :repository => repository, :form => :select).should =~ expected
    end
  end
end

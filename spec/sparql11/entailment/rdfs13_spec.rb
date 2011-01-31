# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# RDFS inference test to show that newly introduced surrogate blank nodes are not to be returned in query answers
# 
# /Users/ben/Repos/datagraph/tests/tests/sparql11-tests/data-sparql11/entailment/rdfs13.rq
#
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2001/sw/DataAccess/tests/r2#rdfs13
#
# This test is approved: 
# 
#
describe "W3C test" do
  context "entailment" do
    before :all do
      @data = %q{
@prefix ex: <http://example.org/ns#> .

ex:s ex:p "foo" .

}
      @query = %q{
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
SELECT ?L
WHERE {
  ?L a rdfs:Literal
}


}
    end

    example "RDFS inference test to show that newly introduced surrogate blank nodes are not to be returned in query answers", :status => 'unverified', :w3c_status => 'unapproved' do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}


      repository = 'entailment-rdfs13'
      expected = [
      ]


      sparql_query(:graphs => graphs, :query => @query,       # unordered comparison in rspec is =~
                   :repository => repository, :form => :select).should =~ expected
    end
  end
end

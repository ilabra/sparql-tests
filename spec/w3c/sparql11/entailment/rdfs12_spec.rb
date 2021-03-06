# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# RDFS inference test members of rdfs:ContaierMembershipProperty
# 
# /Users/ben/Repos/dydra/tests/tests/sparql11-tests/data-sparql11/entailment/rdfs12.rq
#
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2001/sw/DataAccess/tests/r2#rdfs12
#
# This test is approved: 
# 
#
describe "W3C test" do
  context "entailment" do
    before :all do
      @data = %q{
@prefix ex: <http://example.org/ns#> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .

ex:favourite-fruit a rdf:Seq .
ex:favourite-fruit rdf:_1 ex:banana .
ex:favourite-fruit rdf:_2 ex:apple .
ex:favourite-fruit rdf:_3 ex:pear .

}
      @query = %q{
PREFIX ex: <http://example.org/ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
SELECT ?x
WHERE {
  ?x rdf:type rdfs:ContainerMembershipProperty .
}


}
    end

    example "RDFS inference test members of rdfs:ContaierMembershipProperty", :w3c_status => 'unapproved', :implementation => 'nyi' do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}


      repository = 'entailment-rdfs12'
      expected = [
          { 
              :x => RDF::URI('http://www.w3.org/1999/02/22-rdf-syntax-ns#_1'),
          },
          { 
              :x => RDF::URI('http://www.w3.org/1999/02/22-rdf-syntax-ns#_2'),
          },
          { 
              :x => RDF::URI('http://www.w3.org/1999/02/22-rdf-syntax-ns#_3'),
          },
      ]


      sparql_query(:graphs => graphs, :query => @query,       # unordered comparison in rspec is =~
                   :repository => repository, :form => :select).should =~ expected
    end
  end
end

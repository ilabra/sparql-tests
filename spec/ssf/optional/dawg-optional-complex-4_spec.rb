# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# Complex optional semantics: 4
# Complex optional: LeftJoin(Join(BGP(..),Union(..,..)),Join(BGP(..),Graph(varOrIRI,{..})))
# /Users/ben/repos/datagraph/tests/tests/data-r2/optional/q-opt-complex-4.rq
#
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2001/sw/DataAccess/tests/r2#dawg-optional-complex-4
#
# This test is approved: 
# http://lists.w3.org/Archives/Public/public-rdf-dawg/2007JulSep/att-0096/21-dawg-minutes.html
#
describe "W3C test" do
  context "optional" do
    before :all do
      @data = %q{
@prefix rdf:    <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix foaf:       <http://xmlns.com/foaf/0.1/> .
@prefix ex:        <http://example.org/things#> .
@prefix xsd:        <http://www.w3.org/2001/XMLSchema#> .

_:a rdf:type foaf:Person ;
    foaf:name "Eve" ;
    ex:empId "9"^^xsd:integer .
		
_:b rdf:type foaf:Person ;
    foaf:name "Alice" ;
    ex:empId "29"^^xsd:integer ;
    ex:healthplan ex:HealthPlanD.
		
_:c rdf:type foaf:Person ;
    foaf:name "Fred" ;
    ex:empId "27"^^xsd:integer .

_:e foaf:name "Bob" ;
    ex:empId "23"^^xsd:integer ;
    ex:healthplan ex:HealthPlanC.

_:f foaf:name "Bob" ;
    ex:empId "30"^^xsd:integer;
    ex:healthplan ex:HealthPlanB.

_:g rdf:type foaf:Person; 
    ex:ssn "000000000";
    foaf:name   "Bert";
    ex:department "DeptA" ;
    ex:healthplan ex:HealthPlanA.
    

}
       # complex-data-1.ttl
       @graph0 = %q{
@prefix foaf:       <http://xmlns.com/foaf/0.1/> .

<tag:alice@example:foafUri> 
    foaf:mbox   <mailto:alice@example.net>;
    foaf:name   "Alice";
    foaf:nick   "WhoMe?";
    foaf:depiction   <http://example.com/alice.png> .

<tag:bert@example:foafUri> 
    foaf:mbox   <mailto:bert@example.net> ;
    foaf:nick   "BigB" ;
    foaf:name   "Bert" .

<tag:eve@example:foafUri> 
    foaf:mbox   <mailto:eve@example.net> ;
    foaf:firstName   "Eve" .

<tag:john@example:foafUri>
    foaf:mbox   <mailto:john@example.net> ;
    foaf:nick   "jDoe";
    foaf:isPrimaryTopicOf <http://example.com/people/johnDoe> .

}
      @query = %q{
(select (?name ?plan ?dept ?img)
        (project (?name ?plan ?dept ?img)
                 (leftjoin
                  (join
                   (bgp (triple ?person <http://xmlns.com/foaf/0.1/name> ?name))
                   (union
                    (bgp (triple ?person <http://example.org/things#healthplan> ?plan))
                    (bgp (triple ?person <http://example.org/things#department> ?dept))))
                  (join
                   (bgp (triple ?person <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://xmlns.com/foaf/0.1/Person>))
                   (graph ?g
                          (bgp
                           (triple ??0 <http://xmlns.com/foaf/0.1/name> ?name)
                           (triple ??0 <http://xmlns.com/foaf/0.1/depiction> ?img)
                           ))))))

}
    end

    example "Complex optional semantics: 4" do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}

      graphs[RDF::URI('complex-data-1.ttl')] = { :data => @graph0, :format => :ttl }

      repository = 'optional-dawg-optional-complex-4'
      expected = [
          { 
              :img => RDF::URI('http://example.com/alice.png'),
              :name => RDF::Literal.new('Alice' ),
              :plan => RDF::URI('http://example.org/things#HealthPlanD'),
          },
          { 
              :name => RDF::Literal.new('Bob' ),
              :plan => RDF::URI('http://example.org/things#HealthPlanC'),
          },
          { 
              :name => RDF::Literal.new('Bob' ),
              :plan => RDF::URI('http://example.org/things#HealthPlanB'),
          },
          { 
              :dept => RDF::Literal.new('DeptA' ),
              :name => RDF::Literal.new('Bert' ),
          },
          { 
              :name => RDF::Literal.new('Bert' ),
              :plan => RDF::URI('http://example.org/things#HealthPlanA'),
          },
      ]


      sparql_query(:graphs => graphs, :query => @query,       # unordered comparison in rspec is =~
                   :repository => repository, :form => :select).should =~ expected
    end
  end
end

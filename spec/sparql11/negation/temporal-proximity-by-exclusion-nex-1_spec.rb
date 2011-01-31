# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# Medical, temporal proximity by exclusion (NOT EXISTS)
# 
# /Users/ben/Repos/datagraph/tests/tests/sparql11-tests/data-sparql11/negation/temporalProximity01.rq
#
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2001/sw/DataAccess/tests/r2#temporal-proximity-by-exclusion-nex-1
#
# This test is approved: 
# 
#
describe "W3C test" do
  context "negation" do
    before :all do
      @data = %q{
@prefix ex:  <http://www.w3.org/2009/sparql/docs/tests/data-sparql11/negation#> .
@prefix dc:  <http://purl.org/dc/elements/1.1/> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .

ex:examination1 a ex:PhysicalExamination;
                dc:date "2010-01-10"^^xsd:date ;
                ex:precedes ex:operation1 ;
                ex:follows ex:examination2  .
ex:operation1   a ex:SurgicalProcedure;
                dc:date "2010-01-15"^^xsd:date;
                ex:follows ex:examination1, ex:examination2 .
ex:examination2 a ex:PhysicalExamination;
                dc:date "2010-01-02"^^xsd:date;
                ex:precedes ex:operation1, ex:examination1 .
}
      @query = %q{
PREFIX ex: <http://www.w3.org/2009/sparql/docs/tests/data-sparql11/negation#>
PREFIX dc: <http://purl.org/dc/elements/1.1/>

# The closest pre-operative physical examination
SELECT ?exam ?date { 
  ?exam a ex:PhysicalExamination; 
        dc:date ?date;
        ex:precedes ex:operation1 .
  ?op   a ex:SurgicalProcedure; dc:date ?opDT .
  FILTER NOT EXISTS {
    ?otherExam a ex:PhysicalExamination; 
               ex:follows ?exam;
               ex:precedes ex:operation1
  } 
}
}
    end

    example "Medical, temporal proximity by exclusion (NOT EXISTS)", :status => 'unverified', :w3c_status => 'unapproved' do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}


      repository = 'negation-temporal-proximity-by-exclusion-nex-1'
      expected = [
          { 
              :date => RDF::Literal.new('2010-01-10' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#date')),
              :exam => RDF::URI('http://www.w3.org/2009/sparql/docs/tests/data-sparql11/negation#examination1'),
          },
      ]


      sparql_query(:graphs => graphs, :query => @query,       # unordered comparison in rspec is =~
                   :repository => repository, :form => :select).should =~ expected
    end
  end
end

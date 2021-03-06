# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# Group-4
# Grouping with expression
# /Users/ben/Repos/datagraph/tests/tests/sparql11-tests/data-sparql11/grouping/group04.rq
#
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2001/sw/DataAccess/tests/r2#group04
#
# This test is approved: 
# 
#
describe "W3C test" do
  context "grouping" do
    before :all do
      @data = %q{
@prefix : <http://example/> .

:s1 :p 1 .
:s1 :q 9 .
:s2 :p 2 . 

}
      @query = %q{
PREFIX :        <http://example/>
PREFIX xsd:     <http://www.w3.org/2001/XMLSchema#>

SELECT ?X (SAMPLE(?v) AS ?S)
{
  ?s :p ?v .
  OPTIONAL { ?s :q ?w }
}
GROUP BY (COALESCE(?w, "1605-11-05"^^xsd:date) AS ?X) 

}
    end

    example "Group-4", :w3c_status => 'unapproved' do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}


      repository = 'grouping-group04'
      expected = [
          { 
              :S => RDF::Literal.new('2' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
              :X => RDF::Literal.new('1605-11-05' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#date')),
          },
          { 
              :S => RDF::Literal.new('1' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
              :X => RDF::Literal.new('9' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
          },
      ]


      sparql_query(:graphs => graphs, :query => @query,       # unordered comparison in rspec is =~
                   :repository => repository, :form => :select).should =~ expected
    end
  end
end

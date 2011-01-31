# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# COUNT 3
# Count with grouping and HAVING clause
# /Users/ben/Repos/datagraph/tests/tests/sparql11-tests/data-sparql11/aggregates/agg03.rq
#
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2001/sw/DataAccess/tests/r2#agg03
#
# This test is approved: 
# 
#
describe "W3C test" do
  context "aggregates" do
    before :all do
      @data = %q{
@prefix : <http://www.example.org/> .

:s :p1 :o1, :o2, :o3.
:s :p2 :o1, :o2.

}
      @query = %q{
PREFIX : <http://www.example.org>

SELECT ?P (COUNT(?O) AS ?C)
WHERE { ?S ?P ?O }
GROUP BY ?P
HAVING (COUNT(?O) > 2 )

}
    end

    example "COUNT 3", :status => 'unverified', :w3c_status => 'unapproved' do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}


      repository = 'aggregates-agg03'
      expected = [
          { 
              :C => RDF::Literal.new('3' , :datatype => RDF::URI('http://www.w3.org/2001/XMLSchema#integer')),
              :P => RDF::URI('http://www.example.org/p1'),
          },
      ]


      sparql_query(:graphs => graphs, :query => @query,       # unordered comparison in rspec is =~
                   :repository => repository, :form => :select).should =~ expected
    end
  end
end

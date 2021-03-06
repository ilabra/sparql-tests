# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# constructwhere02 - CONSTRUCT WHERE
# CONSTRUCT WHERE  with join
# /Users/ben/Repos/dydra/tests/tests/sparql11-tests/data-sparql11/construct/constructwhere02.rq
#
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2001/sw/DataAccess/tests/r2#constructwhere02
#
# This test is approved: 
# http://www.w3.org/2009/sparql/meeting/2011-02-01#resolution_3
#
describe "W3C test" do
  context "construct" do
    before :all do
      @data = %q{
@prefix : <http://example.org/> .

:s1 :p :o1 .
:s2 :p :o1 .
:s2 :p :o2 .
:s3 :p :o3 .

}
      @query = %q{
PREFIX : <http://example.org/>

CONSTRUCT WHERE { :s1 :p ?o . ?s2 :p ?o }
}
    end

    example "constructwhere02 - CONSTRUCT WHERE" do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}
      repository = 'construct-constructwhere02'
      expected = RDF::Graph.new do | graph |
        graph << RDF::Statement.new(
            :subject => RDF::URI('http://example.org/s2'),
            :predicate => RDF::URI('http://example.org/p'),
            :object => RDF::URI('http://example.org/o1'))
        graph << RDF::Statement.new(
            :subject => RDF::URI('http://example.org/s1'),
            :predicate => RDF::URI('http://example.org/p'),
            :object => RDF::URI('http://example.org/o1'))
      end
      sparql_query(:graphs => graphs, :query => @query,
                   :repository => repository, :form => :construct).should be_isomorphic_with expected
    end
  end
end

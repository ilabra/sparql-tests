# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# LangMatches-basic
# the basic range 'de-de' does not match 'de-Latn-de'
# /Users/ben/repos/datagraph/tests/tests/data-r2/expr-builtin/q-langMatches-de-de.rq
#
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2001/sw/DataAccess/tests/r2#dawg-langMatches-basic
#
# This test is approved: 
# http://lists.w3.org/Archives/Public/public-rdf-dawg/2007JulSep/att-0087/14-dawg-minutes.html
#
describe "W3C test" do
  context "expr-builtin" do
    before :all do
      @data = %q{
# data-langMatches-de.ttl
# $Id: data-langMatches-de.ttl,v 1.2 2007/08/11 18:30:56 eric Exp $

@prefix : <http://example.org/#> .

:x :p3 "abc"@de .
:x :p4 "abc"@de-de .
:x :p5 "abc"@de-latn-de .

}
      @query = %q{
# q-langMatches-de-de.rq
# $Id: q-langMatches-de-de.rq,v 1.1 2007/08/11 18:32:04 eric Exp $

PREFIX : <http://example.org/#>

SELECT *
{ :x ?p ?v . FILTER langMatches(lang(?v), "de-de") . }

}
    end

    example "LangMatches-basic" do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}


      repository = 'expr-builtin-dawg-langMatches-basic'
      expected = [
          { 
              :p => RDF::URI('http://example.org/#p4'),
              :v => RDF::Literal.new('abc' ),
          },
      ]


      sparql_query(:graphs => graphs, :query => @query,       # unordered comparison in rspec is =~
                   :repository => repository, :form => :select).should =~ expected
    end
  end
end

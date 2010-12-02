# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# lang-case-insensitive-ne
# 'xyz'@en != 'xyz'@EN
# /Users/ben/repos/datagraph/tests/tests/data-r2/expr-builtin/lang-case-sensitivity-ne.rq
#
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2001/sw/DataAccess/tests/r2#lang-case-insensitive-ne
#
# This test is approved: 
# http://www.w3.org/2007/06/19-dawg-minutes.html
#
describe "W3C test" do
  context "expr-builtin" do
    before :all do
      @data = %q{
# Data: minimal test of plain literal language sensitivity
# $Id: lang-case-sensitivity.ttl,v 1.1 2007/06/24 23:15:38 lfeigenb Exp $

@prefix     : <http://example/> .

:x2 :p "xyz"@en .
:x3 :p "xyz"@EN .

}
      @query = %q{
# Test: 'xyz'@en != 'xyz'@EN
# $Id: lang-case-sensitivity-ne.rq,v 1.1 2007/06/24 23:15:38 lfeigenb Exp $

PREFIX     :    <http://example/>
PREFIX  xsd:    <http://www.w3.org/2001/XMLSchema#>

SELECT *
{
    ?x1 :p ?v1 .
    ?x2 :p ?v2 .
    FILTER ( ?v1 != ?v2 )
}

}
    end

    example "lang-case-insensitive-ne" do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}


      repository = 'expr-builtin-lang-case-insensitive-ne'
      expected = [
      ]


      sparql_query(:graphs => graphs, :query => @query,       # unordered comparison in rspec is =~
                   :repository => repository, :form => :select).should =~ expected
    end
  end
end

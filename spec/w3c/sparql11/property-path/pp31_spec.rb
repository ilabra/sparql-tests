# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# (pp31) Operator precedence 2
# 
# /Users/ben/Repos/dydra/tests/tests/sparql11-tests/data-sparql11/property-path/path-p2.rq
#
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2001/sw/DataAccess/tests/r2#pp31
#
# This test is approved: 
# http://www.w3.org/2009/sparql/meeting/2011-03-29#resolution_3
#
describe "W3C test" do
  context "property-path" do
    before :all do
      @data = %q{
@prefix :  <http://www.example.org/> .

:a :p1 :b .
:b :p4 :c .
:a :p2 :d .
:d :p3 :c .
:a :p1 :e .



}
      @query = %q{
prefix :  <http://www.example.org/>
select ?t
where {
  :a (:p1|:p2)/(:p3|:p4) ?t
}
}
    end

    example "(pp31) Operator precedence 2", :status => 'unverified' do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}


      repository = 'property-path-pp31'
      expected = [
          { 
              :t => RDF::URI('http://www.example.org/c'),
          },
          { 
              :t => RDF::URI('http://www.example.org/c'),
          },
      ]


      sparql_query(:graphs => graphs, :query => @query,       # unordered comparison in rspec is =~
                   :repository => repository, :form => :select).should =~ expected
    end
  end
end

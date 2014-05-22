# coding: utf-8
#
require 'spec_helper'

# Auto-generated by build_w3c_tests.rb
#
# delete-insert-03b
# 
# This is a W3C test from the DAWG test suite:
# http://www.w3.org/2009/sparql/docs/tests/data-sparql11/construct
#
describe "W3C test" do
  context "delete-insert" do
    before :all do
      @query = IO.read(File.dirname(__FILE__) + "/delete-insert-03b.ru");
      @data = ""; 
    end

    example "DELETE INSERT 03b negative syntax", :w3c_status => 'approved' do
    
      graphs = {}
      graphs[:default] = { :data => @data, :format => :ttl}

      repository = 'delete-insert-03b'

      expect { sparql_query(:graphs => graphs, :query => @query,
                            :repository => repository, :form => :select)} . to raise_error
    end
  end
end

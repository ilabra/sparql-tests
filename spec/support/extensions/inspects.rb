# override several inspect functions to improve output for what we're doing

class Array
  alias_method :old_inspect, :inspect

  def inspect
    if all? { |item| item.is_a?(Hash) }
      string = "[\n"
      each do |item|
        string += "  {\n"
          item.keys.map(&:to_s).sort.each do |key|
            string += "      #{key}: #{item[key.to_sym].inspect}\n"
          end
        string += "  },\n"
      end
      string += "]"
      string
    else
      old_inspect
    end
  end
end

class RDF::Literal
  require 'rdf/ntriples'
  def inspect
    RDF::NTriples::Writer.serialize(self) + " R:L:(#{self.class.to_s.match(/([^:]*)$/)})"
  end
end

class RDF::URI
  def inspect
    RDF::NTriples::Writer.serialize(self)
  end
end

class RDF::Node
  def inspect
    RDF::NTriples::Writer.serialize(self)
  end
end

module RSpec
  module Matchers
    class MatchArray
      private
      def safe_sort(array)
        case
          when array.all?{|item| item.respond_to?(:<=>) && !item.is_a?(Hash)}
            array.sort
          else
            array
        end
      end
    end
  end
end

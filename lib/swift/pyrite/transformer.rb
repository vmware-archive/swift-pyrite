require 'parslet'

module Swift
  module Pyrite
    class Transformer
      def initialize(ast)
        @ast = ast
      end

      def protocol_name
        @ast[:protocol_name]
      end

      def struct_name
        "Fake#{protocol_name}"
      end

      def generate
        output = []
        output << "class #{struct_name}: #{protocol_name} {"
        (@ast[:expressions] || []).map do |exp|
          output << expression(exp)
        end
        output << "}"
        output.join("\n")
      end

      def expression(exp)
        if exp[:type] == 'func'
          stubFunction(exp[:funcSignature])
        end
      end

      def stubFunction(exp)
        name = exp[:name]
        output = []
        output << variables(exp)
        output << "  func #{name}(#{arguments(exp[:arguments])}) {"
        output << "    #{name}CallCount += 1"
        unless exp[:arguments].nil?
          output << saveArguments(name, exp[:arguments])
        end
        output << "  }"
        output << ""
        output.join("\n")
      end

      def variables(exp)
        output = []
        output << "  var #{exp[:name]}CallCount: Int = 0"
        unless exp[:arguments].nil?
          types = exp[:arguments].map {|a| a[:type] }
          tupleType = "(" + types.join(", ") + ")"
          output << "  var #{exp[:name]}CalledWith: [#{tupleType}] = [#{tupleType}]()"
        end
        output.join("\n")
      end

      def arguments(exp)
        return if exp.nil?
        output = []
        exp.each do |arg|
          output << "#{arg[:name]}: #{arg[:type]}"
        end
        output.join(", ")
      end

      def saveArguments(funcname, exp)
        "    #{funcname}CalledWith.append((" + exp.map {|a| a[:name] }.join(", ") + "))"
      end
    end
  end
end

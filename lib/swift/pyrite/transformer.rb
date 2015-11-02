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
        output << "struct #{struct_name}: #{protocol_name} {"
        (@ast[:expressions] || []).each do |exp|
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
        output << "  var callsTo#{name}: Int = 0"
        output << "  func #{name}() {"
        output << "    callsTo#{name} += 1"
        output << "  }"
        output.join("\n")
      end
    end
  end
end

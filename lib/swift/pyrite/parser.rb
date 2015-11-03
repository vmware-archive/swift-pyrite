require 'parslet'

module Swift
  module Pyrite
    class Parser < Parslet::Parser
      rule(:ws) { match(/\s/).repeat(1) }
      rule(:ws?) { ws.maybe }

      rule(:generic) { str('<') >> type >> str('>') }
      rule(:type) { (str('[').maybe >> identifier >> generic.maybe >> str(']').maybe).as(:type) }

      rule(:brace_expression) { str('{') >> ws? >> (func_decl).repeat.as(:expressions) >> str('}') }

      rule(:tuple_part) { (identifier.as(:name) >> str(':')).maybe >> ws? >> type }
      rule(:tuple) { str('(') >> (tuple_part >> (str(',') >> ws?).maybe).repeat(1) >> ws? >> str(')') }
      rule(:empty_tuple) { str('(') >> ws? >> str(')') }

      rule(:func_signature) { identifier.as(:name) >> ws? >> (tuple.as(:arguments) | empty_tuple) >> ws? }
      rule(:func_decl) { ws? >> str('func').as(:type) >> ws? >> (func_signature >> returnTypes.maybe).as(:func_decl) >> ws? }
      rule(:func_decl?) { func_decl.maybe }

      rule(:returnTypes) { ws? >> str('->') >> ws? >> (tuple | type.repeat(1, 1)).as(:returnTypes) }

      rule(:identifier) { match('[A-Za-z_]').repeat(1) }

      rule(:protocol) { str('protocol') >> ws? >> identifier.as(:protocol) >> ws? >> brace_expression }

      rule(:source_file) { protocol }

      rule(:root) { source_file }
    end
  end
end
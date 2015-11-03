require 'parslet'

module Swift
  module Pyrite
    class Parser < Parslet::Parser
      rule(:ws) { match(/\s/).repeat(1) }
      rule(:ws?) { ws.maybe }

      rule(:block_comment) { ws? >> str('/*') >> (str('*/').absent? >> any).repeat >> str('*/') >> ws? }
      rule(:comment) { ws? >> str('//') >> match(/[^\n]/).repeat }
      rule(:ig) { (comment | block_comment | ws).repeat }

      rule(:ignore_before) { block_comment | comment | (str('protocol').absent? >> any) }

      rule(:generic) { str('<') >> type >> str('>') }
      rule(:type) { (str('[').maybe >> identifier >> generic.maybe >> str(']').maybe).as(:type) }

      rule(:brace_expression) { str('{') >> ig >> (func_decl).repeat.as(:expressions) >> str('}') }

      rule(:tuple_part) { (identifier.as(:name) >> str(':')).maybe >> ig >> type }
      rule(:tuple) { str('(') >> (tuple_part >> (str(',') >> ig).maybe).repeat(1) >> ig >> str(')') }
      rule(:empty_tuple) { str('(') >> ig >> str(')') }

      rule(:func_signature) { identifier.as(:name) >> ig >> (tuple.as(:arguments) | empty_tuple) >> ig }
      rule(:func_decl) { ig >> str('func').as(:type) >> ig >> (func_signature >> returnTypes.maybe).as(:func_decl) >> ig }
      rule(:func_decl?) { func_decl.maybe }

      rule(:returnTypes) { ig >> str('->') >> ig >> (tuple | type.repeat(1, 1)).as(:returnTypes) }

      rule(:identifier) { match('[A-Za-z_]').repeat(1) }

      rule(:protocol) { str('protocol') >> ig >> identifier.as(:protocol) >> ig >> brace_expression }

      rule(:source_file) { ignore_before.repeat >> protocol >> any.repeat }

      rule(:root) { source_file }
    end
  end
end

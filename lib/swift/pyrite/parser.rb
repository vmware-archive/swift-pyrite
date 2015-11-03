require 'parslet'

module Swift
  module Pyrite
    class Parser < Parslet::Parser
      rule(:ws) { match(/\s/).repeat(1) }
      rule(:ws?) { ws.maybe }

      rule(:brace_expression) { str('{') >> ws? >> (func_decl).repeat.as(:expressions) >> str('}') }
      rule(:tuple) { str('(') >> str(')') }

      rule(:func_decl) { ws? >> str('func').as(:type) >> ws? >> (identifier.as(:name) >> ws? >> tuple >> ws?).as(:func_decl) }
      rule(:func_decl?) { func_decl.as.maybe }

      rule(:identifier) { match('[A-Za-z_]').repeat(1) }

      rule(:protocol) { str('protocol') >> ws? >> identifier.as(:protocol) >> ws? >> brace_expression }

      rule(:source_file) { protocol }

      rule(:root) { source_file }
    end
  end
end
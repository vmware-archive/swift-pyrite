require 'parslet'

module Swift
  module Pyrite
    class SwiftParser < Parslet::Parser
      rule(:protocol)   { 
        str("protocol") >> space >> identifier.as(:protocol_name) >> space? >> lcurly >> 
        space? >> expression?.as(:expressions) >> space? >> 
        rcurly 
      }

      rule(:identifier) { match("[A-Za-z_]").repeat(1) }

      rule(:space)      { match(/\s/).repeat(1) }
      rule(:space?)     { space.maybe }

      rule(:tab)        { match(/\t/) }
      rule(:newline)    { match(/\n/) }

      rule(:lcurly)     { str("{") }
      rule(:rcurly)     { str("}") }

      rule(:lparen)     { str("(") }
      rule(:rparen)     { str(")") }

      rule(:colon)      { str(":") }

      rule(:funcSignature) { str(' ').repeat(1).maybe >> (str("func") >> space >> identifier >> lparen >> rparen).as(:funcSignature) >> newline }


      rule(:expression)  { funcSignature.repeat(1) }
      rule(:expression?) { expression.maybe }


      rule(:file) { protocol }
      root(:file)
    end
  end
end
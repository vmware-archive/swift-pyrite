require 'parslet'

module Swift
  module Pyrite
    class Parser < Parslet::Parser
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

      rule(:indentation) { (str(' ') | str("\t")).repeat(1).maybe }
      rule(:funcSignature) { indentation >> str("func").as(:type) >> space >> (identifier.as(:name) >> 
        lparen >> arguments.as(:arguments).maybe >> rparen).as(:funcSignature) >> 
        newline 
      }

      rule(:comma) { str(",") }
      rule(:comma_space) { space? >> comma.maybe >> space? }
      rule(:arguments) { (identifier.as(:name) >> colon >> space? >> identifier.as(:type) >> comma_space).repeat(1) }

      rule(:expression)  { funcSignature.repeat(1) }
      rule(:expression?) { expression.maybe }


      rule(:file) { protocol }
      root(:file)
    end
  end
end
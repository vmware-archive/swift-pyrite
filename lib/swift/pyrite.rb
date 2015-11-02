require "swift/pyrite/version"

module Swift
  module Pyrite
	class Parser
    attr_reader :protocol_name
		def parse(protocol_name, code)
      @protocol_name = protocol_name
		end
	end

	class Generator
	end
  end
end
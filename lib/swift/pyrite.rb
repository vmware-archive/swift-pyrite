require_relative "pyrite/version"
require_relative "pyrite/parser"

module Swift
  module Pyrite
    def self.generate_fake_for(protocol_name, file_path, output_path)
      code = File.read(file_path)
      parser = SwiftParser.new

      require 'pp'
      pp parser.parse(code)

      File.open(output_path, 'w+') do |f|
        f.write("struct FakeTrivial: Trivial {\n}")
      end
    end
  end
end
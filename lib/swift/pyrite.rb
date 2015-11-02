require_relative "pyrite/version"
require_relative "pyrite/parser"
require_relative "pyrite/transformer"

module Swift
  module Pyrite
    def self.generate_fake_for(protocol_name, file_path, output_path)
      code = File.read(file_path)
      parser = Parser.new

      require 'pp'
      pp (ast = parser.parse(code))

      transformer = Transformer.new(ast)

      File.open(output_path, 'w+') do |f|
        f.write(transformer.generate)
      end
    end
  end
end
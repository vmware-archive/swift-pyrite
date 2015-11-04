require_relative "pyrite/version"
require_relative "pyrite/parser"
require_relative "pyrite/transformer"
require_relative "pyrite/cli"

module Swift
  module Pyrite
    def self.generate_fake_for(file_path, output_path)
      code = File.read(file_path)
      parser = Parser.new

      ast = parser.parse(code)

      transformer = Transformer.new(ast)

      File.open(output_path, 'w+') do |f|
        f.write(transformer.generate)
      end
    end
  end
end

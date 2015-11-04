require 'thor'

module Swift
  module Pyrite
    class Cli < Thor
      desc "generate INPUT_PATH OUTPUT_PATH", "Generates a fake for protocol in INPUT_PATH and writes it to OUTPUT_PATH"
      def generate(input_path, output_path)
        generator.generate_fake_for(input_path, output_path)
      end

      no_commands do
        def generator
          Pyrite
        end
      end
    end
  end
end

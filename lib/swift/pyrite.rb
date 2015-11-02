require "swift/pyrite/version"

module Swift
  module Pyrite
    def self.generate_fake_for(protocol_name, file_path, output_path)
      File.open(output_path, 'w+') do |f|
        f.write("struct FakeTrivial: Trivial {\n}")
      end
    end
  end
end
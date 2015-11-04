require 'spec_helper'
require 'fileutils'
require 'active_support'
require 'active_support/core_ext'

describe Swift::Pyrite do
  before do
    FileUtils.mkdir_p(File.dirname(output_path))
    FileUtils.rm_f(output_path)
    FileUtils.touch(expected_path)
  end

  let(:output_path) { File.join(File.dirname(__FILE__), "../actual_fakes/#{name}") }
  let(:fixture_path) { File.join(File.dirname(__FILE__), "../protocols/#{name}") }
  let(:expected_path) { File.join(File.dirname(__FILE__), "../expected_fakes/#{name}") }

  let(:expected_code) { File.read(expected_path).strip }
  let(:actual_code) { File.read(output_path).strip }

  shared_examples_for "a swift file" do
    it "parses" do
      Swift::Pyrite.generate_fake_for(fixture_path, output_path)
      expect(actual_code).to(eq(expected_code))
    end
  end

  here = File.dirname(__FILE__)
  path = '../protocols'
  Dir.glob(File.join(here, path, '*.swift')).each do |file|
    file = File.basename(file)
    context file do
      let(:name) { file }
      it_behaves_like("a swift file")
    end
  end
end

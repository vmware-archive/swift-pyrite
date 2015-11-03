require 'spec_helper'
require 'fileutils'
require 'active_support'
require 'active_support/core_ext'

describe Swift::Pyrite do
  before do
    FileUtils.mkdir_p(File.dirname(output_path))
    FileUtils.rm_f(output_path)
  end

  let(:output_path) { File.join(File.dirname(__FILE__), "../../out/out.swift") }
  let(:fixture_path) { File.join(File.dirname(__FILE__), "../protocols/#{name}.swift") }
  let(:expected_path) { File.join(File.dirname(__FILE__), "../expected_fakes/#{name}.swift") }

  let(:expected_code) { File.read(expected_path) }
  let(:actual_code) { File.read(output_path) }

  shared_examples_for "a swift file" do
    it "parses" do
      Swift::Pyrite.generate_fake_for(protocol, fixture_path, output_path)
      expect(actual_code).to(eq(expected_code))
    end
  end

  %w{
    trivial
    single_method
    multiple_methods
    one_argument
    two_arguments
    return_value
    array_return
    multiple_return
    busy
    block_comment
    with_class
    with_variables
  }.each do |file|
    context file do
      let(:name) { file }
      let(:protocol) { file.classify }
      it_behaves_like("a swift file") 
    end
  end
end

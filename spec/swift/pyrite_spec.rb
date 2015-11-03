require 'spec_helper'
require 'fileutils'

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

  context "a trivial protocol" do
    let(:name) { "trivial" }

    it "parses" do
      Swift::Pyrite.generate_fake_for("Trivial", fixture_path, output_path)
      expect(actual_code).to(eq(expected_code))
    end
  end

  context "a single-method protocol" do
    let(:name) { 'single_method' }

    it 'parses' do
      Swift::Pyrite.generate_fake_for("SingleMethod", fixture_path, output_path)
      expect(actual_code).to(eq(expected_code))
    end
  end

  context "a multi-method protocol" do
    let(:name) { 'multiple_methods' }

    it 'parses' do
      Swift::Pyrite.generate_fake_for("MultipleMethods", fixture_path, output_path)
      expect(actual_code).to(eq(expected_code))
    end
  end

  context "a single argument method" do
    let(:name) { 'one_argument' }

    it 'parses' do
      Swift::Pyrite.generate_fake_for("OneArgument", fixture_path, output_path)
      expect(actual_code).to(eq(expected_code))
    end
  end

  context "a couple argument method" do
    let(:name) { 'two_arguments' }

    it 'parses' do
      Swift::Pyrite.generate_fake_for("TwoArguments", fixture_path, output_path)
      expect(actual_code).to(eq(expected_code))
    end
  end

  context "a return method" do
    let(:name) { 'return_value' }

    it 'parses' do
      Swift::Pyrite.generate_fake_for("ReturnValue", fixture_path, output_path)
      expect(actual_code).to(eq(expected_code))
    end
  end

end

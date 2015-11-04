require 'spec_helper'

describe Swift::Pyrite::Cli do
  let(:pyrite) { double(:pyrite) }

  before do
    allow_any_instance_of(described_class).to(receive(:generator)).and_return(pyrite)
  end

  context "#generate" do
    let(:argv) { ["generate", "foo.swift", "fake_foo.swift"] }

    it 'delegates the options to the pyrite module' do
      expect(pyrite).to(receive(:generate_fake_for)).with('foo.swift', 'fake_foo.swift')
      described_class.start(argv)
    end
  end
end

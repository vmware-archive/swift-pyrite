require 'spec_helper'

describe Swift::Pyrite::Transformer do
  subject { described_class.new({}) }

  describe '#unwind_type' do
    context "simple type" do
      let(:input_expression) do
        {
          :type_name=>"String"
        }
      end

      it "unwinds to 'String'" do
        str = subject.unwind_type(input_expression)
        expect(str).to(eq('String'))
      end
    end

    context "array literal type" do
      let(:input_expression) do
        {
          :type_name=>"String",
          :bracketed=>"[",
        }
      end

      it "unwinds to '[String]'" do
        str = subject.unwind_type(input_expression)
        expect(str).to(eq('[String]'))
      end
    end

    context "array literals and generics" do
      let(:input_expression) do
        {
          :type_name=>"Array",
          :bracketed=>"[",
          :generic=>{
            :type_name=>"String"
          }
        }
      end

      it "unwinds to '[Array<String>]'" do
        str = subject.unwind_type(input_expression)
        expect(str).to(eq('[Array<String>]'))
      end
    end

    context "array literals and generics" do
      let(:input_expression) do
        {
          :type_name=>"Array",
          :generic=>{
            :bracketed=>"[",
            :type_name=>"String"
          }
        }
      end

      it "unwinds to 'Array<[String]>'" do
        str = subject.unwind_type(input_expression)
        expect(str).to(eq('Array<[String]>'))
      end
    end

    context "single generic" do
      let(:input_expression) do
        {
          :type_name=>"Array",
          :generic=>{
            :type_name=>"String"
          }
        }
      end

      it "unwinds to 'Array<String>'" do
        str = subject.unwind_type(input_expression)
        expect(str).to(eq('Array<String>'))
      end
    end

    context "double generic" do
      let(:input_expression) do
        {
          :type_name=>"Array",
          :generic=>{
            :type_name=>"Array",
            :generic=>{
              :type_name=>"Ruby"
            }
          }
        }
      end

      it "unwinds to 'Array<Array<Ruby>>'" do
        str = subject.unwind_type(input_expression)
        expect(str).to(eq('Array<Array<Ruby>>'))
      end
    end
  end
end

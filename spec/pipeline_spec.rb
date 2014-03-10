require 'spec_helper'

module StringProcessing

  describe Pipeline do

    describe ".define" do

      it "returns a new class to do the processing" do
        FooPipeline = Pipeline.define{}
        expect(FooPipeline.methods).to include :process
      end

      it "sets up a processing pipeline based a DSL" do
        FooPipeline = Pipeline.define do
          using proc{|x| x.map(&:downcase) }
          using proc{|x| x.map(&:strip) }
        end
        expect(FooPipeline.process([" FOO "])).to eq ["foo"]
      end

    end

    describe ".process" do

      it "always flattens arrays" do
        FooPipeline = Pipeline.define do
          using proc{|x| x.map{|n| n.split('/')} }
          using proc{|x| x.map(&:downcase) }
        end
        expect(FooPipeline.process(["HTML/CSS"])).to eq ["html", "css"]
      end

      it "accepts a string" do
        FooPipeline = Pipeline.define do
          using proc{|x| x.map{|n| n.split('/')} }
          using proc{|x| x.map(&:downcase) }
        end
        expect(FooPipeline.process("HTML/CSS")).to eq ["html", "css"]
      end

    end

  end
end

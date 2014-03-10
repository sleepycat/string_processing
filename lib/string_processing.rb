require "string_processing/version"

module StringProcessing
  class Pipeline

    def self.define
      b = Proc.new
      @@processors = []
      class_eval(&b)

      Class.new do
        @@using = @@processors

        def self.process *thing
          @@using.each{|x| thing = x.call(thing.flatten) }
          thing
        end

      end
    end

    def self.using theblock
      @@processors << theblock
    end

  end
end

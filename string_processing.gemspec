# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'string_processing/version'

Gem::Specification.new do |spec|
  spec.name          = "string_processing"
  spec.version       = StringProcessing::VERSION
  spec.authors       = ["Mike Williamson"]
  spec.email         = ["mike@korora.ca"]
  spec.summary       = "Create a text processing pipeline."
  spec.description   = "A library to create text processing pipelines."
  spec.homepage      = "https://github.com/sleepycat/string_processing"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end

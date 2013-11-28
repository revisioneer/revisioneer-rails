# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'revisioneer_rails/version'

Gem::Specification.new do |spec|
  spec.name          = "revisioneer_rails"
  spec.version       = RevisioneerRails::VERSION
  spec.authors       = ["Raphael Randschau"]
  spec.email         = ["nicolai86@me.com"]
  spec.description   = %q{Rails engine to consume and present revisioneer service}
  spec.summary       = %q{Rails engine to consume and present revisioneer}
  spec.homepage      = "http://blog.nicolai86.eu"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "sqlite3"
  spec.add_dependency "rails", ">= 3.2", "< 5.0"
  spec.add_dependency "typhoeus", "~> 0.6.6"
end

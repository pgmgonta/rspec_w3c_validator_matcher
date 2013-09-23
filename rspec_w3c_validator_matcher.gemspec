# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec_w3c_validator_matcher/version'

Gem::Specification.new do |spec|
  spec.name          = "rspec_w3c_validator_matcher"
  spec.version       = RspecW3cValidatorMatcher::VERSION
  spec.authors       = ["pgmgonta"]
  spec.email         = ["pgm.gonta@gmail.com"]
  spec.description   = %q{RSpec Custom Matcher with W3C Validators}
  spec.summary       = %q{RSpec Custom Matcher}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency             "w3c_validators"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end

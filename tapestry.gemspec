# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tapestry/version'

Gem::Specification.new do |spec|
  spec.name          = "tapestry"
  spec.version       = Tapestry::VERSION
  spec.authors       = ["Masaaki Morishita"]
  spec.email         = ["ikasama3.0@gmail.com"]
  spec.summary       = %q{TAP tools and Tap wrapper testing framework.}
  spec.description   = %q{TAP tools and Tap wrapper testing framework in Ruby.}
  spec.homepage      = "https://github.com/morishitter/tapestry"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end

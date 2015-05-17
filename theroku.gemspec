# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'theroku/version'

Gem::Specification.new do |spec|
  spec.name          = "theroku"
  spec.version       = "0.1.0"
  spec.authors       = ["alejoescobar", "simon0191", "jasmo2"]
  spec.email         = ["alejoescobac@gmail.com"]
  spec.summary       = "Awesome Heroku load balancer."
  spec.description   = "Gem to balance heroku servers."
  spec.homepage      = "https://github.com/alejoescobar/theroku"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.bindir = 'bin'
  spec.add_development_dependency('rdoc', '4.2.0')
  spec.add_runtime_dependency('docopt', '0.5.0')

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end

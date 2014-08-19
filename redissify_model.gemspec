# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'redissify_model/version'

Gem::Specification.new do |spec|
  spec.name          = "redissify_model"
  spec.version       = RedissifyModel::VERSION
  spec.authors       = ["Charles Darwin Pobre"]
  spec.email         = ["cdpobre@yahoo.com"]
  spec.summary       = "Helps you cache DB objects on a Redis server"
  spec.description   = "Cache Model objects as key value store on Redis. It maps through namespaced models"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "redis", "~> 3.1"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "sequel", "~> 4.0"
end

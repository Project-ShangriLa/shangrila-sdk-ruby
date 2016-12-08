# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shangrila/version'

Gem::Specification.new do |spec|
  spec.name          = "shangrila"
  spec.version       = Shangrila::VERSION
  spec.authors       = ["AKB428"]
  spec.email         = ["gandara016+1@gmail.com"]
  spec.summary       = %q{ShanguriLa. Anime API SDK}
  spec.description   = %q{ShanguriLa. Anime REST API SDK}
  spec.homepage      = "https://github.com/Project-ShangriLa"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency "httpclient"
  spec.executables << 'anime-api'
end

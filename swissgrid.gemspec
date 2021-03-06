# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'swissgrid/version'

Gem::Specification.new do |spec|
  spec.name          = "swissgrid"
  spec.version       = Swissgrid::VERSION
  spec.authors       = ["Alexander Rueedlinger"]
  spec.email         = ["a.rueedlinger@gmail.com"]
  spec.summary       = %q{A library to convert gps points into the Swiss coordinate system (CH1903).}
  spec.description   = %q{Swissgrid is a library to convert gps points into the Swiss coordinate system (CH1903).}
  spec.homepage      = "https://github.com/lexruee/swissgrid"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~>0"
  spec.add_development_dependency "rspec-core", "~>0"
end

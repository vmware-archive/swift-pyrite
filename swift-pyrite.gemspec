# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'swift/pyrite/version'

Gem::Specification.new do |spec|
  spec.name          = "swift-pyrite"
  spec.version       = Swift::Pyrite::VERSION
  spec.authors       = ["Genevieve L'Esperance", "Ehren Murdick"]
  spec.email         = ["emurdick@pivotal.io", "glesperance@pivotal.io"]

  spec.summary       = %q{Pyrite generates instrumented fakes for swift protocols}
  spec.description   = %q{Pyrite generates instrumented fakes for swift protocols. It's a clone of github.com/maxbrunsfeld/counterfeiter}
  spec.homepage      = "http://google.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = "pyrite"
  spec.require_paths = ["lib"]

  spec.add_dependency 'parslet', '~> 1.7'
  spec.add_dependency 'thor', "~> 0.19"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "activesupport", "~> 4.2"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_development_dependency "rspec", "~> 3.3"
end

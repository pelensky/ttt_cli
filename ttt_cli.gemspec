# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ttt_cli/version'

Gem::Specification.new do |spec|
  spec.name          = "ttt_cli"
  spec.version       = TttCli::VERSION
  spec.authors       = ["Dan Pelensky"]
  spec.email         = ["dan@pelensky.com"]

  spec.summary       = "A command line game of Tic Tac Toe"
  spec.description   = "Playable on a 3x3 or 4x4 board. Uses my ttt_core gem"
  spec.homepage      = "https://github.com/pelensky/ttt_cli"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.executables   = ["ttt_cli"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "coveralls", "~> 0.8.21"
  spec.add_dependency "ttt_core", "~> 0.5.0"
end

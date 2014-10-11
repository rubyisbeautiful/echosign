# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'echosign/version'

Gem::Specification.new do |spec|
  spec.name          = 'echosign'
  spec.version       = Echosign::VERSION
  spec.authors       = ['rubyisbeautiful']
  spec.email         = ['bcptaylor@gmail.com']
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = 'https://github.com/rubyisbeautiful/echosign'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake'

  spec.add_runtime_dependency 'cupcakinator'
  spec.add_runtime_dependency 'hashie'
  spec.add_runtime_dependency 'httpi'
  spec.add_runtime_dependency 'multi_json'
  spec.add_runtime_dependency 'semverse'


end

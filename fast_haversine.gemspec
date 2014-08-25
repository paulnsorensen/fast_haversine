# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fast_haversine/version'

Gem::Specification.new do |spec|
  spec.name          = 'fast_haversine'
  spec.version       = FastHaversine::VERSION
  spec.authors       = ['Paul Sorensen']
  spec.email         = ['paulnsorensen@gmail.com']
  spec.summary       = 'Ruby Haversine Calculation with C extension'
  spec.description   = 'Haversine calculation written in Ruby that supports both
                       distances in miles and kilometers'
  spec.homepage      = 'https://github.com/paulnsorensen/fast_haversine'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
  spec.extensions = ['ext/fast_haversine/extconf.rb']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake-compiler'
end

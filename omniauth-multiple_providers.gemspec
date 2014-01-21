# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/multiple_providers/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-multiple_providers"
  spec.version       = Omniauth::MultipleProviders::VERSION
  spec.authors       = ["Takuya Kato"]
  spec.email         = ["info@takuya.com"]
  spec.description   = %q{Support omniauth for multiple provider}
  spec.summary       = %q{Support omniauth for multiple provider}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency 'omniauth'
  spec.add_dependency 'activesupport'
end

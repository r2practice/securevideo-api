# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'securevideo/api/version'

Gem::Specification.new do |spec|
  spec.name          = "securevideo-api"
  spec.version       = Securevideo::Api::VERSION
  spec.authors       = ["Maxim Pechnikov"]
  spec.email         = ["parallel588@gmail.com"]

  spec.summary       = %q{API wrapper of securevideo.com}
  spec.description   = %q{api}
  spec.homepage      = "https://github.com/r2practice/securevideo-api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.add_dependency 'excon', '~> 0.44.4'
  spec.add_dependency 'faraday', '~> 0.9', '>= 0.9.1'
  spec.add_dependency 'faraday_middleware', '~> 0.9', '>= 0.9.1'
  spec.add_dependency 'oj', '~> 2.12', '>= 2.12.1'
  spec.add_dependency 'her', '~> 0.7.3'

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry", '~> 0.10', '>= 0.10.1'
  spec.add_development_dependency 'rspec', '~> 3.2', '>= 3.2.0'
  spec.add_development_dependency 'webmock', '~> 1.20', '>= 1.20.4'
  spec.add_development_dependency 'timecop', '~> 0.7', '>= 0.7.1'
  spec.add_development_dependency 'vcr', '~> 2.9', '>= 2.9.3'
end

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'webbtc/version'

Gem::Specification.new do |s|
  s.name        = 'webbtc-ruby'
  s.version     = Webbtc::VERSION
  s.date        = '2015-07-13'
  s.summary     = 'Ruby SDK for Webbtc'
  s.description = 'Ruby SDK for Webbtc'
  s.authors     = ['Genaro Madrid']
  s.email       = 'genmadrid@gmail.com'
  s.files       = ['lib/webbtc.rb']
  s.homepage    = 'https://github.com/genaromadrid/webbtc-ruby'
  s.license     = 'Apache License'

  s.files         = `git ls-files -z`.split("\x0")
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']

  s.add_runtime_dependency 'rest-client', '~> 1.8'
  s.add_runtime_dependency 'json', '~> 1.8'

  s.add_development_dependency 'bundler', '~> 1.6'
  s.add_development_dependency 'rspec', '3.1.0'
  s.add_development_dependency 'pry-byebug', '~> 3.0'

end
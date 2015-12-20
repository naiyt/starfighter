lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'starfighter/version'

Gem::Specification.new do |gem|
  gem.name           =  'shell_sim'
  gem.version        =  Starfighter::VERSION
  gem.date           =  '2015-12-20'
  gem.summary        =  'starfighter.io API wrapper'
  gem.description    =  'TODO: Add description'
  gem.authors        =  ["Nate Collings"]
  gem.email          =  'nate@natecollings.com'
  gem.homepage       =  'https://github.com/naiyt/starfighter'
  gem.license        =  'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = []
  gem.test_files    = gem.files.grep(%r{^(test|spec)/})
  gem.require_paths = ['lib']

  gem.required_ruby_version = '>= 2.1.5'

  gem.add_development_dependency 'rspec', '>= 3.0.0'
  gem.add_development_dependency 'rspec-mocks', '>= 3.0.0'
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'pry-nav'
end

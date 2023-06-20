require File.expand_path('../lib/basicons_helper/version', __FILE__)

Gem::Specification.new do |s|
  s.name          = 'basicons_helper'
  s.version       = BasiconsHelper::VERSION
  s.summary       = 'Rails basicons helper'
  s.homepage      = 'https://basicons.xyz'
  s.authors       = 'razeos at tossdev'
  s.files         = Dir['lib/**/*']
  s.license       = 'MIT'
  s.require_paths = ['lib']

  s.add_dependency 'basicons', '~> 1.0'
  s.add_dependency 'railties', '~> 7.0'
  s.add_dependency 'actionview', '~> 7.0'
end

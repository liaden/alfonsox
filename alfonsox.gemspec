# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'alfonsox/constants'
require 'alfonsox/version'

Gem::Specification.new do |spec|
  spec.name          = 'alfonsox'
  spec.version       = AlfonsoX::VERSION
  spec.authors       = ['Diego J. Romero López']
  spec.email         = ['diegojromerolopez@gmail.com']

  spec.summary       = 'Spell checker for code'
  spec.description   = 'Spell checker for code'
  spec.homepage      = AlfonsoX::REPOSITORY_URL
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features)/})
    end
  end
  spec.bindir        = 'exe'
  spec.executables   = ['alfonsox']
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.4'

  spec.add_dependency 'hunspell'
  spec.add_dependency 'nokogiri', '~> 1.8', '>= 1.8.5'
  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'simplecov'
end

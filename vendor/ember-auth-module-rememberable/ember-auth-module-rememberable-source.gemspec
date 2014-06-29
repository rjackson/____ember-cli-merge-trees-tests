# -*- encoding: utf-8 -*-
require 'json'

package = JSON.parse(File.read('package.json'))

Gem::Specification.new do |gem|
  gem.name        = 'ember-auth-module-rememberable-source'
  gem.version     = package['version']
  gem.authors     = ['heartsentwined']
  gem.email       = ['heartsentwined.me@gmail.com']
  gem.date        = Time.now.strftime('%Y-%m-%d')
  gem.summary     = 'Ember-auth rememberable module source code wrapper'
  gem.description = 'Ember-auth rememberable module source code wrapper for ruby libs.'
  gem.homepage    = 'https://github.com/heartsentwined/ember-auth-module-rememberable'

  gem.files       = ['dist/ember-auth-module-rememberable.js',
                     'lib/ember/auth/module/rememberable/source.rb']

  gem.add_dependency 'ember-source',      '~> 1.0'
  gem.add_dependency 'ember-auth-source', '~> 9.0'

  gem.license     = 'MIT'
end

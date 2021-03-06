# encoding: UTF-8
$:.push File.expand_path("../lib", __FILE__)
require "spree_base_currency/version"
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_base_currency'
  s.version     = SpreeBaseCurrency::VERSION
  s.summary     = 'Spree adding base price with currency'
  s.description = 'Adding base price with currency conversion to local currency to all variants of product.'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'Dmitry Biryukov'
  s.email     = 'dmitry@biryukov.net'
  s.homepage  = 'http://github.com/dmitryz'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 2.3.1'

  s.add_development_dependency 'capybara', '~> 2.1'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.4'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.13'
  s.add_development_dependency 'sass-rails', '~> 4.0.2'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end

# encoding: utf-8

Gem::Specification.new do |gem|
  gem.name    = 'table_helpers'
  gem.version = '0.8'
  gem.date    = Time.now.strftime('%Y-%m-%d')

  gem.summary = "Table helpers for Rails 3.2.x"
  gem.description = "The table_helpers library provides a simple helpers to create table lists with headers and presenting data in tables."

  gem.author  = 'Damian Baćkowski'
  gem.email    = 'damianbackowski@gmail.com'
  gem.homepage = 'https://github.com/dbackowski/table_helpers'

  gem.rubyforge_project = nil
  gem.has_rdoc = false

  gem.files = Dir['Rakefile', '{bin,lib,rails,test,spec}/**/*', 'README*', 'LICENSE*'] & `git ls-files -z`.split("\0")
end

require 'rake'
require 'rake/testtask'
require 'rake/task'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the table_helpers plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end


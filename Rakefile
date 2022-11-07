# frozen_string_literal: true
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'test'
end

desc 'Run tests'
task :default do
  ENV['TEST'] = 'test/test_gbro_teemill.rb'
  Rake::Task[:test].execute
end
# frozen_string_literal: true

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.pattern = 'test/**/test_*.rb'
  t.libs << 'test'
  t.warning = false
end

desc 'Run tests'
task default: :test

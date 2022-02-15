require 'rake'
require 'rspec/core'
require 'rspec/core/rake_task'
require 'simplecov'

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/*_spec.rb']
end

task default: :spec

# vim:ft=ruby

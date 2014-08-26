require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rake/extensiontask'

RSpec::Core::RakeTask.new(:spec)
task default: :spec

Rake::ExtensionTask.new('fast_haversine') do |ext|
  ext.lib_dir = 'lib/fast_haversine'
end

Rake::Task[:spec].prerequisites << :compile

require 'gem2deb/rake/spectask'

ENV['LANG'] = 'C.UTF-8'

skip = [
  'spec/rubocop/config_loader_spec.rb',
]
if ENV['AUTOPKGTEST_TMP']
  skip << './spec/rubocop/cop/generator_spec.rb'
  skip << './spec/rubocop/cli/cli_options_spec.rb'
end

Gem2Deb::Rake::RSpecTask.new do |spec|
  spec.pattern = './spec/**/*_spec.rb'
  spec.exclude_pattern = skip.join(',')
end

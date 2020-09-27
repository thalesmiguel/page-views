# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

namespace :page_views do
  desc 'Lists page views provided a supported .log file is presented as an argument'
  task :run, [:file_path] do |_t, args|
    require 'page_views'

    # PageViews.perform(args.file_path.to_s)
    PageViews.perform('/Users/thales.miguel/Projects/SP Test - Ruby (1)/webserver.log')
  end
end

RSpec::Core::RakeTask.new(:spec)

task default: :spec

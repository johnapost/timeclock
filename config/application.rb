require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module Timeclock
  class Application < Rails::Application
    config.generators do |g|
      g.template_engine :haml
      g.test_framework :rspec, fixture: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.view_specs false
      g.helper_specs false
      g.stylesheets false
      g.javascripts false
    end

    config.time_zone = 'Eastern Time (US & Canada)'
    config.active_record.default_timezone = 'Eastern Time (US & Canada)'
  end
end

require 'simplecov'
SimpleCov.start
SimpleCov.command_name 'RSpec'

require 'devise'
require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist
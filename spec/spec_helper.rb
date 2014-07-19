require 'simplecov'
require 'devise'

SimpleCov.start

require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist
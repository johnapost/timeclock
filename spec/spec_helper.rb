require 'simplecov'
require 'devise'

SimpleCov.start

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end
  config.before(:each) do
    DatabaseCleaner.start
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.include Devise::TestHelpers, type: :controller
end

require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist
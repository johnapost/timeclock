Given(/^there are admin and employee accounts$/) do
  @admin = FactoryGirl.create :admin
  @employee = FactoryGirl.create :employee
end

Given(/^I am at the login page$/) do
  visit new_user_session_path
end

When(/^I visit the (\w+) page$/) do |page|
  visit eval "#{page}_path"
end

Then(/^the (\w+) should be successfully (\w+)$/) do |model, message|
  page.should have_content "#{model} successfully #{message}"
end
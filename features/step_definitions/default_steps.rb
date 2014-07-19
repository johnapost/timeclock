Given(/^there are admin and employee accounts$/) do
  @admin = FactoryGirl.create :admin
  @employee = FactoryGirl.create :employee
end

Given(/^I am at the (\w+) page$/) do |page|
  if page == 'login'
    visit new_user_session_path
  else
    visit eval "#{page}_path"
  end
end

When(/^I click (.+)$/) do |link|
  click_link link
end

When(/^I visit the (\w+) page$/) do |page|
  visit eval "#{page}_path"
end

When(/^I refresh the page$/) do
  visit current_path
end

Then(/^the (\w+) should be successfully (\w+)$/) do |model, message|
  page.should have_content "#{model} successfully #{message}"
end
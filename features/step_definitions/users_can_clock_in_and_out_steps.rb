Given(/^I am logged in as an (\w+)$/) do |role|
  visit root_path

  within ('form') do
    fill_in 'user_email', with: eval("@#{role}.email")
    fill_in 'user_password', with: eval("@#{role}.password")
    click_button 'Sign in'
  end

  page.should have_content 'Signed in successfully.'
end

Given(/^I am clocked in as an (\w+)$/) do |role|
  @time_log = FactoryGirl.create :time_log
  @time_log.user_id = eval("@#{role}.id")
  @time_log.clock_out = nil
  @time_log.save!
end

Given(/^there is an existing time log$/) do
  @time_log = FactoryGirl.create :time_log
end

When(/^I clock in with an existing ID$/) do
  within ('.clock_in') do
    fill_in 'time_log_id', with: @time_log.id
    click_button 'Clock in'
  end
end

When(/^I clock out$/) do
  within ('.clock_out') do
    click_button 'Clock out'
  end
end

When(/^I clock in$/) do
  within ('.clock_in') do
    fill_in 'time_log_id', with: SecureRandom.random_number(600)
    click_button 'Clock in'
  end
end

Then(/^the timer should start running$/) do
  page.should have_content "Successfully clocked in"
  page.should_not have_content 'New Time Log'
  page.should have_content 'Running Clock'
end

Then(/^the timer should stop running$/) do
  page.should have_content "Successfully clocked out"
  page.should have_content 'New Time Log'
  page.should_not have_content 'Running Clock'
end

Then(/^display how long I was clocked in$/) do
  pending
end

Then(/^I should get a duplicate ID warning$/) do
  page.should have_content 'That ID already exists. Please try a different one.'
end
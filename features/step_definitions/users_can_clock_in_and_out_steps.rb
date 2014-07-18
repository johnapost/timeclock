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
  @clocked_in_time = DateTime.parse((Time.now - 1.hour.ago).to_s)

  TimeLog.create(
    user_id: eval("@#{role}.id"),
    clock_in: @clocked_in_time
  )
end

When(/^I clock out$/) do
  click_button 'Clock out'
end

When(/^I clock in$/) do
  within ('form') do
    fill_in 'time_log_id', with: SecureRandom.random_number(600)
    click_button 'Clock in'
  end
end

Then(/^the timer should start running$/) do
  page.should have_content "Clocked in at #{Time.now}."
  page.should have_content 'Clock out'
end

Then(/^the timer should stop running$/) do
  pending
end

Then(/^display how long I was clocked in$/) do
  pending
end
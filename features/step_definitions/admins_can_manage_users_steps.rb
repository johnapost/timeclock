Given(/^there is another admin$/) do
  @another_admin = FactoryGirl.create :admin
end

Given(/^the employee has time logs$/) do
  (0..2).each do
    current_log = FactoryGirl.create :time_log, user_id: @employee.id
  end
end
When(/^I create an (\w+)$/) do |role|
  @password = Faker::Internet.password

  @email = Faker::Internet.email

  within ('form') do
    select role, from: 'user_role'
    fill_in 'user_email', with: @email
    fill_in 'user_first_name', with: 'Jimmy'
    fill_in 'user_last_name', with: role.capitalize
    fill_in 'user_password', with: @password
    fill_in 'user_password_confirmation', with: @password
    click_button 'Save'
  end
end

When(/^I delete an employee$/) do
  within (".user_#{@employee.id}") do
    click_link 'Delete User'
  end
end

When(/^I delete an admin$/) do
  within (".user_#{@another_admin.id}") do
    click_link 'Delete User'
  end
end

Then(/^I should see that (\w+)$/) do |role|
  page.should have_content "Successfully created Jimmy #{role.capitalize}"
  page.should have_content @email
end

Then(/^I should not see that employee anymore$/) do
  page.should have_content "Successfully deleted #{@employee.display_name}."
end

Then(/^I should not see that admin anymore$/) do
  page.should have_content "Successfully deleted #{@another_admin.display_name}."
end

Then(/^I should see employee time logs$/) do
  page.should have_content @employee.display_name
  (0..2).each do |index|
    page.should have_content @employee.time_logs[index].display_duration
  end
end

Then(/^I should not see employee time logs$/) do
  page.should_not have_content @employee.display_name
  (0..2).each do |index|
    page.should_not have_content @employee.time_logs[index].display_duration
  end
end
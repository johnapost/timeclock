Given(/^the employee has time logs$/) do
  (0..2).each do
    current_log = FactoryGirl.create :time_log
    current_log.user_id = @employee.id
    current_log.save!
  end
end

Then(/^I should see employee time logs$/) do
  page.should have_content @employee.email
  (0..2).each do |index|
    page.should have_content @employee.time_logs[index].display_duration
  end
end

Then(/^I should not see employee time logs$/) do
  page.should_not have_content @employee.email
  (0..2).each do |index|
    page.should_not have_content @employee.time_logs[index].display_duration
  end
end
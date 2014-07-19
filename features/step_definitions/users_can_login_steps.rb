When(/^I enter my (\w+) credentials$/) do |role|
  within ('form') do
    fill_in 'user_email', with: eval("@#{role}.email")
    fill_in 'user_password', with: eval("@#{role}.password")
    click_button 'Sign in'
  end
end

When(/^I enter the wrong (\w+) credentials$/) do |role|
  within ('form') do
    fill_in 'user_email', with: eval("@#{role}.email")
    fill_in 'user_password', with: 'wrongpassword'
    click_button 'Sign in'
  end
end

Then(/^I should be successfully logged in$/) do
  page.should have_content 'Signed in successfully.'
end

Then(/^I should be refused access$/) do
  page.should have_content 'Invalid email or password.'
end
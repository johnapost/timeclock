Then(/^I should be denied access$/) do
  page.should have_content 'You do not have sufficient access.'
end
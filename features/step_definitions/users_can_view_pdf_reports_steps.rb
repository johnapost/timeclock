When(/^I view the employee's PDF$/) do
  within (".user_#{@employee.id}") do
    click_link 'Report'
  end
end

Then(/^I should see all of the employee's recent time logs$/) do
  convert_pdf_to_page

  page.should have_content @employee.display_name
end


def convert_pdf_to_page
  reader = PDF::Reader.new(StringIO.new(page.source))
  pdf_text = reader.pages.map(&:text)
  page.driver.response.instance_variable_set('@body', pdf_text)
end
When(/^I view the employee's PDF$/) do
  within (".user_#{@employee.id}") do
    click_link 'Report'
  end
end

When(/^I view my PDF$/) do
  click_link 'Report'
end

Then(/^I should see all of the employee's recent time logs$/) do
  employee_logs
end

Then(/^I should see all of my recent time logs$/) do
  employee_logs
end

private
  def employee_logs
    convert_pdf_to_page

    page.should have_content @employee.display_name
    @employee.time_logs.seven_days.each do |log|
      page.should have_content log.id
      page.should have_content log.display_clock_in
      page.should have_content log.display_clock_out
      page.should have_content log.display_duration
    end
  end

  def convert_pdf_to_page
    reader = PDF::Reader.new(StringIO.new(page.source))
    pdf_text = reader.pages.map(&:text)
    page.driver.response.instance_variable_set('@body', pdf_text)
  end
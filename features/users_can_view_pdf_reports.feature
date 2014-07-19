Feature: Users can view PDF reports
  Employees can view their own PDF reports.
  Admins can view everyone's PDF reports.

  Background:
    Given there are admin and employee accounts
    And the employee has time logs

  Scenario: Admin views employee's report
    Given I am logged in as an admin
    And I visit the users page
    When I view the employee's PDF
    Then I should see all of the employee's recent time logs

  @wip
  Scenario: Employee views his/her own report
    Given I am logged in as an employee
    When I view my PDF
    Then I should see all of my recent time logs
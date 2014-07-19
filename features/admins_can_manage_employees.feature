Feature: Admins can manage employees
  Admins can create and delete employees.
  Admins can only view employee time logs when clocked in.

  Background:
    Given there are admin and employee accounts
    And the employee has time logs

  @javascript
  Scenario: Admin cannot view employee time logs when not clocked in
    Given I am logged in as an admin
    Then I should not see employee time logs

  @javascript
  Scenario: Admin views employee time logs after clocking in
    Given I am logged in as an admin
    When I clock in
    Then I should see employee time logs
Feature: Admins can manage users
  Admins can create and delete users.
  Admins can only view employee time logs when clocked in.

  Background:
    Given there are admin and employee accounts
    And the employee has time logs

  @javascript
  Scenario: Admin creates a new employee
    Given I am logged in as an admin
    And I visit the users page
    When I create an employee
    Then I should see that employee

  @javascript
  Scenario: Admin deletes an employee
    Given I am logged in as an admin
    And I visit the users page
    When I delete an employee
    Then I should not see that employee anymore

  @javascript
  Scenario: Admin creates a new admin
    Given I am logged in as an admin
    And I visit the users page
    When I create an admin
    Then I should see that admin

  @javascript
  Scenario: Admin deletes an admin
    Given I am logged in as an admin
    And there is another admin
    And I visit the users page
    When I delete an admin
    Then I should not see that admin anymore

  @javascript
  Scenario: Admin cannot view employee time logs when not clocked in
    Given I am logged in as an admin
    Then I should not see employee time logs

  @javascript
  Scenario: Admin views employee time logs after clocking in
    Given I am logged in as an admin
    When I clock in
    Then I should see employee time logs
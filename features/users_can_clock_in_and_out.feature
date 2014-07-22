Feature: Users can clock in and out
  Both admin and employee users can clock in to record the duration of a task.
  Users are also able to clock out at the end of a task.
  Pertinent information is displayed once clocked out and a task is complete.

  Background:
    Given there are admin and employee accounts

  @javascript
  Scenario: Employee can clock in
    Given I am logged in as an employee
    When I clock in
    Then the timer should start running

  @javascript
  Scenario: Employee can clock out
    Given I am clocked in as an employee
    And I am logged in as an employee
    When I clock out
    Then the timer should stop running

  @javascript
  Scenario: Employee enters an ID already in use
    Given there is an existing time log
    And I am logged in as an employee
    When I clock in with an existing ID
    Then I should get a duplicate ID warning

  @javascript
  Scenario: Admin can clock in
    Given I am logged in as an admin
    When I clock in
    Then the timer should start running

  @javascript
  Scenario: Admin can clock out
    Given I am clocked in as an admin
    And I am logged in as an admin
    When I clock out
    Then the timer should stop running

  @javascript
  Scenario: Admin enters an ID already in use
    Given there is an existing time log
    And I am logged in as an admin
    When I clock in with an existing ID
    Then I should get a duplicate ID warning
Feature: Employees cannot access restricted areas
  Employees are not able to access the users page.

  Background:
    Given there are admin and employee accounts
    And I am logged in as an employee

  Scenario: Employee cannot access users page.
    When I visit the users page
    Then I should be denied access
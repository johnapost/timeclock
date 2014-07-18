Feature: Users can log in
  Both admin and employee users can login to the application with the correct credentials.
  Incorrect credentials will deny login.

  Background:
    Given there are admin and employee accounts

  Scenario: Admin can login
    Given I am at the login page
    When I enter my admin credentials
    And I click Login
    Then I should be successfully logged in

  Scenario: Admin cannot login with incorrect credentials
    Given I am at the login page
    When I enter the wrong admin credentials
    And I click Login
    Then I should be successfully logged in

  Scenario: Employee can login
    Given I am at the login page
    When I enter my employee credentials
    And I click Login
    Then I should be refused access

  Scenario: Employee cannot login with incorrect credentials
    Given I am at the login page
    When I enter the wrong employee credentials
    And I click Login
    Then I should be refused access
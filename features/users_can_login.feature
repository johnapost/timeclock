Feature: Users can log in
  Both admin and employee users can login to the application with the correct credentials.
  Incorrect credentials will deny login.

  Background:
    Given there are admin and employee accounts

  Scenario: Admin can login
    Given I am at the login page
    When I enter my admin credentials
    Then I should be successfully logged in

  @wip
  Scenario: Admin cannot login with incorrect credentials
    Given I am at the login page
    When I enter the wrong admin credentials
    Then I should be refused access

  Scenario: Employee can login
    Given I am at the login page
    When I enter my employee credentials
    Then I should be successfully logged in

  @wip
  Scenario: Employee cannot login with incorrect credentials
    Given I am at the login page
    When I enter the wrong employee credentials
    Then I should be refused access
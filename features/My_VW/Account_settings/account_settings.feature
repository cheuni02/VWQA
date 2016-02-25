@Account_Settings @my_vw

Feature: Account settings
  As a user I want to view Account settings section in My account
  so I can change my email address and change my password
  or I can delete my account when I don't need it anymore

  Background: Ensuring i am logged in
    Given I visit login page
    And I login with valid credentials

  @login_complete_details_user
  Scenario: Account settings form - view mode
    When I am viewing My account
    Then I should see my Email and Password displayed in account settings section
    And my password should be masked
    And email address should be correct
    And view mode should be active by default for account settings form

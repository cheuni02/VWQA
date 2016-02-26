@Account-Settings @Personal_details @my_vw
Feature: Personal details
  As a user I want to view My Account
  and see Personal details section there
  so I can enter or modify provided information

  Background: Ensuring i am logged in
    Given I visit the My Volkswagen login page
    And I login with correct credentials

  @login_complete_details_user
  Scenario: Personal details form - view mode
    When I navigate to the My account section
    Then I should see personal details section to be displayed with correct fields:
      | Field          |
      | Name:          |
      | Home number:   |
      | Mobile number: |
      | Work number:   |
      | Date of birth: |
    And view mode should be active by default for personal details form
    And personal details fields in the form should be populated with correct data


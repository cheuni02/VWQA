@Account_Settings @Address_details @my_vw

Feature: Address details
  As a user I want to view My Account
  and see Address details section there
  so I can enter or modify provided information

  Background: Ensuring i am logged in
    Given I visit My Volkswagen login page
    And I login with my credentials

  @login_complete_details_user
  Scenario: Address details form - view mode
    When I go to the My account section
    Then I should see address details section to be displayed with correct fields:
      | Field           |
      | House name / no:|
      | Address 1:      |
      | Address 2:      |
      | Town / city:    |
      | County:         |
      | Postcode:       |
    And view mode should be active by default for address detail form
    And address details fields in the form should be populated with correct data

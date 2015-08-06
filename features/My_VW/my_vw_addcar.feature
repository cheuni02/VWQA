@vw-plugin-cps-vw-section-my
Feature: VW - Add Car
  As the owner of the VW website
  I want users to be able to add their cars
  And manage their data

  Background:
    Given that I have a VW account
    And that its logged in

  @login
  Scenario: Add Car - Loading
    When I go to add a new car onto my Volkswagen Profile
    Then it should load the add new car page in my browser

  @login
  Scenario: Add Car - Current
    When I enter details for my new car as if they are my current car
    And I enter "FE06KHO" as the registration number
    And I finish the registration
    Then car should be displayed on the profile page
    And the cars details should be correct

  @login
  Scenario: Add Car - Previous
    When I enter details for my new car as if they are my previous car
    And I enter "FE06KHO" as my registration number
    And I finish the process
    Then car should be displayed
    And the details should be correct

  @login @Disabled
  Scenario: Add Car - Ordered
    When I set the new car as my ordered car
    And I enter "24303822" as the order number
    And I finish the reg process
    Then ordered car should be displayed
    And the details should be right

  @login
  Scenario: Add Car - Company Car
    When I set this car as my current car
    And I enter "FE06KHO" as the reg number
    And I finish the registration with a company car
    Then the car should be displayed on the profile page
    And these details should be correct

  @login
  Scenario: Add Car - Used car
    When I set the car as my current car
    And I enter "FE06KHO" as my reg number
    And I finish the registration with a used car
    Then the used car should be displayed on the profile page
    And those details should be correct

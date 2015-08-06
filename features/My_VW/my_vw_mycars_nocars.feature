@vw-plugin-cps-vw-section-my
Feature: VW Profile Page - My Cars - No cars added
  As the owner of the VW website
  I'd like to ensure that the functionality of the "My Cars" page still works
  And all links/items point in the right direction without error

  @login
  Scenario: Positive - Page Display - 0 cars
    Given I have gone to the profile page
    When I have logged in on a profile with no cars attached
    Then the profile page should be loaded with just an Add Car button

  @login
  Scenario: Positive - Add Car link
    Given I am on the profile page
    When I click on the Add Car link
    Then the add car page should load correctly

@vw-plugin-cps-vw-section-my
Feature: VW Profile Page - My Cars - Cars added
  As the owner of the VW website
  I'd like to ensure that the functionality of the "My Cars" page still works
  And all links/items point in the right direction without error

  Background:
    Given I have navigated to the profile page
    And I have logged in correctly

  @login
  Scenario: Positive - Page Display - >0 cars
    Then the profile page should be loaded
    And I can see the Book A Service link
    And the My Next Steps links should be displayed
    And the Top Owners FAQs section should also be displayed
    And there are 5 items in the FAQ section to click on
    And I can see the How-To videos

  @login
  Scenario: Positive - Book a Service
    Given I have logged in correctly on a user with added cars
    When I have clicked on the Book A Service link
    Then I should be taken to the service booking functionality

  @login
  Scenario: Positive - FAQ links
    Given I have navigated to the profile page with cars
    When I click on each FAQ item
    Then the FAQ item content should display

  @login
  Scenario: Positive - More FAQs
    Given that I have navigated to the profile page with cars
    When I click on the link to see more FAQ items
    Then the need help page should appear

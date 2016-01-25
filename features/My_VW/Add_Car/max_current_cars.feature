@my_vw @Add-Current-Car
Feature: Maximum amount of current cars
  As the VW site owner
  I want to set maximum amount of cars to be added to user account
  So user is alerted and advised to remove a car before adding another

  @login_Current_User @clear_cookies
  Scenario: I have logged into my VW account with max amount of current cars added
    Given I am on the Volkswagen Homepage
    When I login into my account
    And I go to add a new car
    Then I will be on add a car section with options:
      | I'd like to add  |
      | A car I own      |
      | A car I ordered  |
      | A configured car |
    But none will be set

    When I select the A car I own button
    Then I will see a pop up informing me Car limit reached

    When I select ok
    Then I will be on add a car section with options:
      | I'd like to add  |
      | A car I own      |
      | A car I ordered  |
      | A configured car |
    But none will be set

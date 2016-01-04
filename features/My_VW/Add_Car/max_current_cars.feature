@login_Current_User @Max_Current_Cars
Feature: Maximum amount of current cars
  As the VW site owner
  I want to set maximum amount of cars to be added to user account
  So user is alerted and advised to remove a car before adding another

  Background:
    Given i have logged into my VW account with max amount of current cars added
    And i go to the add a car page

  Scenario: Popup alert
    When i click on the button to add car I own
    Then i should see pop up message about reaching max number of current cars added
    And i can click on confirm alert to return back

  Scenario: Remove and add car
    When i remove current car from my account
    Then i can add current car successfully
    And no pop up alert appears


@login_Current_User @Delete
Feature: Delete car from dropdown
  As a user logged in the My VW site
  I want to be able to remove car from my account directly from dropdown menu

  Background:
    Given i have logged into my VW account with added current and ordered cars
    And i go to the My cars

  Scenario: Delete current car
    When i click delete icon to remove current car from my account
    Then i need to confirm pop up alert to remove car
     And current car is removed from My cars

  Scenario: Delete ordered car
    When i click delete icon to remove ordered car from my account
    Then i need to confirm pop up alert to remove ordered car
    And  ordered car is removed from My cars


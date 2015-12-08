@login @my-vw
Feature: Delete car from dropdown
  As a user logged in the My VW site
  I want to be able to remove car from my account directly from dropdown menu
  To allow myself to better manage the cars that are added to my account

  Background:
    Given i have logged into my VW account with added current and ordered cars
    And i go to the My cars

  @Edit-Current-Car
  Scenario: Delete current car
    Given i have added a current car to my account
    When i click delete icon to remove current car from my account
    Then i need to confirm pop up alert to remove car
    And current car is removed from My cars

  @Edit-Ordered-Car
  Scenario: Delete ordered car
    Given i have added an ordered car to my account
    When i click delete icon to remove ordered car from my account
    Then i need to confirm pop up alert to remove ordered car
    And  ordered car is removed from My cars

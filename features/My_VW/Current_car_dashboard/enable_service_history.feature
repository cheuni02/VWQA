@my_vw @Current-Car-Dashboard
Feature: Current car dashboard
  As a user logged in the My VW site
  I want to see a page with important information about my current car

  @add_car_user @delete_added_car @logout
  Scenario: Service plan or history is not shown until correct address is supplied

    Given a car with registration SB63YSK and display name My Golf is added to my account

    But there is no address for my account
    When I login into my account
    Then I will be logged into my account
    And a default picture of my last added car type golf is displayed
    And my last added car name is My Golf

    Given I scroll to my service history and plans
    Then I will see a message Please check or update your address to enable this feature in service history and plans section

    When I click on enable service history feature
    Then I'm asked for Just a few details from you... to update my address

    When I enter Postcode with W2 6AA
    And I select lookup

    When I select the back button

    Then I will see my car dashboard
    And a default picture of my last added car type golf is displayed
    And my last added car name is My Golf
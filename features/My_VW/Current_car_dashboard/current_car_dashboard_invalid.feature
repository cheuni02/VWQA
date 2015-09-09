Feature: Current car dashboard - Invalid
  As a user logged in the My VW site
  If my details are not valiated by DBG ID
  I should be able to enter them and enable the service

    Scenario: Invalid DBG ID
      Given that i have logged in to my VW account
      When i am on the MY VW page
      Then i should see a message saying that the registered owner of the car has changed

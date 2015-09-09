Feature: Current car dashboard - Unvalidated
  As a user logged in the My VW site
  If my details are not valiated by DBG ID
  I should be able to enter them and enable the service

    Scenario: Unvalidated DBG ID
      Given that i have logged in to my VW account
      When i am on the MY VW page
      Then i should see the My Service history & plans module
      And I should see the last name and postcode input fields

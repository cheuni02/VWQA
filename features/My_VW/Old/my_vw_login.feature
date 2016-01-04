@Daily @vw-authentication-service
Feature: My Volkswagen Login
  As we have a login section on our website
  We need to make sure that our users can log in successfully
  And once logged in they are taken to the correct page

  Scenario: Going to the login page
    Given i have come back to the VW Homepage
    When i click on the login and register link at the top of my browser
    Then i should be shown a page containing the login and signup forms

  @login
  Scenario: Logging into my account
    When i enter my email into the email field on the page
    And i enter my password into the password box
    And i try to log into my account
    Then i should see the main page of my profile load in my browser

  @login
  Scenario: Logging out
    Given i am logged in to my VW Account
    When i click on the link to log out of my account
    Then i should be returned to the owners homepage

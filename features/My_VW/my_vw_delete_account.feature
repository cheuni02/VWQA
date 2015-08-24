@Delete @Daily
Feature: My Volkswagen Delete account
  As user can create his own profile on VW website
  We need to make sure that user can also delete his profile
  And therefore is not able to use his login credentials to log on again

  @login
   Scenario: Delete account and log in using the same credentials
     Given i am logged in
     And i click on the link to Update profile
     When i delete my profile
     Then i should not be able to login with my credentials again
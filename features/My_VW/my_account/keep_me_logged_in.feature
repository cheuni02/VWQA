@my_vw @Login-2 @keep_me_logged_in
Feature: Keep me logged in option
  As a user
  I want the application to keep me logged in
  so that I don't have to login each time my session expires

 Scenario: I have activated the Keep me logged in option, but now I have logged out myself
   Given I have activated the Keep me logged in option
   And I logged in
   And the keep me logged in cookie should be set in my browser
   When I log out
   And navigate again to the login screen
   Then I should be asked to enter my email and my password
   And the Keep me logged in option should be deselected

 Scenario: closing the tab when the "Keep me logged in" option is active
   Given I am logged in, with the "Keep me logged in" option active
   And I navigate to My account page
   And I close the tab
   When I navigate back to the website using the same browser
   Then I should be automatically logged in
   And I expect to be on My account page



@Login-2 @my_vw
Feature: My VW forgotten password
  As a forgetful user
  I want to be able to request a new password
  so that I am not permanently locked out if I forget it

  Background: Visiting the Login Page
    Given i navigate to the My VW Login Page

  Scenario Outline: Forgotten password - step 1
    When i click on the Forgotten password link
    Then the forgotten password page should be loaded
    And i should be able to enter the <email> for the account I want to recover the password for
    When click on Send button to receive an email with link to reset my password
    Then i should see success page displayed

  Examples:
    | email |
    |AutomatedToastUser1452686315@example.com |
    |not.associated.valid@email.com|

  @clear_cookies
  Scenario Outline: Email field validation
    When i click on the Forgotten password link
    And i enter invalid email address <email_address>
    And click on Send button to receive an email with link to reset my password
    Then i should get an error <error_message> displayed

  Examples:
    | email_address    |error_message |
    |tes**             | Please provide a valid email address|
    |tester            | Please provide a valid email address|
    |tester123@test    | Please provide a valid email address|
    |tester@99         | Please provide a valid email address|
    |@tester.com       | Please provide a valid email address|
    |12_**+@99         | Please provide a valid email address|
    |                  | Please complete email|

  @Register_temp_2
   Scenario: Recover password for an unvalidated email
     When i attempt to recover my password for not validated email address
     And click on Send button to receive an email with link to reset my password
     Then i should see Request new verification link displayed
@my_vw @Login-2 @forgotten_password_user
Feature: My VW reset password page
  As a forgetful user
  I want to be able to reset my password
  so after entering valid password I can successfully login

  Background: navigate to the reset password page
    Given I have sent an email to change password to my address
    When I click on the link to reset my password
    And I navigate to the reset password page

  Scenario: reseting the password
     Then the Password and Repeat password fields should be displayed for me to fill in

  Scenario: the 4 password requirements turn blue as I type in my password and meet the criteria
     When I enter my password I should see what requirements has been fulfilled:
       | password       | 8 - 20 characters | An uppercase letter | A number   | A lowercase letter |
       | Ab123          | not_active        | active              | active     | active             |
       | password123    | active            | not_active          | active     | active             |
       | PasswordTest   | active            | active              | not_active | active             |
       | TESTPWSD123    | active            | active              | active     | not_active         |
       | %%Pass%%%**123 | active            | active              | active     | active             |
       | TESTPWSD123    | active            | active              | active     | not_active         |
       | 123            | not_active        | not_active          | active     | not_active         |

    Scenario Outline: I've pressed Save on the Password reset form without actually entering valid password value
      When I type in my new password <password>
      And I press reset password button
      Then I should get the error message <error message> displayed

    Examples:
     |password|error message|
     |Test1   |Password must contain 8-20 characters|
     |Password123456789123456789 |Password must contain 8-20 characters|
     |testtest|Password must contain an uppercase letter|
     |PASSWORD|Password must contain a lowercase letter|
     |TestTest|Password must contain a number|
     |        |Please choose a password|

   @delete_password_token
   Scenario: password and re-entered password do not coincide
      When I type in my new password
      And I re-enter password that does not match
      And I press reset password button
      Then I should not be able to submit the form and I should see message:
      """
      Passwords don't match
      """
      But when I set re-entered password to match the password
      Then I should be able successfully change my password
      And the success message should be displayed:
      """
      Your password has been successfully updated.
      """
      And I should be able to login with new password

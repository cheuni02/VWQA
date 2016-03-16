@my_vw @Login-2
Feature: My VW Login Version 2
  As the owner of the new My Volkswagen login section
  We need to ensure that existing and new users can access the login form
  And that the relevant security measures work as expected

  Background: Visiting the Login Page
    Given i am on the My VW Login Page

  @login @clear_cookies
  Scenario: Logging in with a validated account
    When i enter my registered account email address
    And i enter my accounts correct password
    And i submit my attempt to login
    Then i should be logged into the My Volkswagen section

  Scenario: Attempted Login with missing details
    When i enter the random unregistered email address
    And i enter a random valid password for this account
    And i submit my attempt to login
    Then i should see a login error appear in my browser:
    """
    Your email and/or password are incorrect. Please try again.
    """

  @Register_temp_2 @clear_cookies @test
  Scenario Outline: Attempted Incorrect Password Login to a registered account
    Given i have previously submitted <number> invalid logins
    When i enter my registered account email address
    And i enter a random valid password for this account
    And i submit my attempt to login
    Then i should see this error message for <number> incorrect login attempts:
    | Feedback                                                                                                       |
    | Account details not recognised. Please try again. You have 4 attempts left. |
    | Account details not recognised. Please try again. You have 3 attempts left. |
    | Account details not recognised. Please try again. You have 2 attempts left. |
    | Account details not recognised. Please try again. You have 1 attempt left.  |

    Examples:
    | number |
    |   0    |
    |   1    |
    |   2    |
    |   3    |

  @Register_temp_2
  Scenario: Account lockout after 5 incorrect password attempts
    Given i have previously submitted 4 invalid logins
    When i enter my registered account email address
    And i enter a random valid password for this account
    And i submit my attempt to login
    Then i should see a login error appear in my browser:
    """
    Sorry, you've tried to login 5 times unsuccessfully and your account has been locked. You can wait 30 minutes and attempt to log in again or you can reset your password  by clicking on forgotten password.
    """

  Scenario: Link to reset my password
    When i click on the link to go to the reset password form
    Then i should see the forgot password form load in my browser

  Scenario: Link to register a new account
    When i click on the link to go to the registration page
    Then i should see the registration form load in my browser

  @clear_cookies @login
  Scenario: Logging out from my account
    Given i enter my registered account email address
    And i enter my accounts correct password
    When i submit my attempt to login
    But i then log out from my Volkswagen account
    Then i should find i am no longer signed into my account

  @clear_cookies
  Scenario Outline: Email address field validation
    When i enter not valid email address <email_address>
    And i submit my attempt to login
    Then i should get the following <error_message> under the email address field displayed

  Examples:
    | email_address    |error_message |
    |tes               | Please provide a valid email address|
    |tester            | Please provide a valid email address|
    |tester@test       | Please provide a valid email address|
    |tester@           | Please provide a valid email address|
    |@tester.com       | Please provide a valid email address|
    |***%%%!@%%%       | Please provide a valid email address|
    |                  | Please complete email|

  @clear_cookies
  Scenario: Password field validation
    When i enter the random unregistered email address
    And i enter not valid password
    And i submit my attempt to login
    Then i should get the following error under the password field displayed:
    """
    Please complete password
    """
  @Register_temp_2
  Scenario: Requesting a verification link
    When I try to login with not verified email address
    Then I should see message that my email address is not verified yet:
    """
    You haven't verified your email address yet. Please check your emails for your verification link and follow it to login. If you can't find it, please check your junk folder or request a new link.
    """
    And I should be able to request a new verification link
    And the following message should be present:
    """
    A new verification link has been sent to you.
    """

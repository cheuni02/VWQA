Feature: My VW Login Version 2
  As the owner of the new My Volkswagen login section
  We need to ensure that existing and new users can access the login form
  And that the relevant security measures work as expected

  Background: Visiting the Login Page
    Given i am on the My VW Login Page

  @login
  Scenario: Logging in with a validiated account
    When i enter my regsitered account email address
    And i enter my accounts correct password
    And i submit my attempt to login
    Then i should be logged into the My Volkswagen section

  Scenario: Attempted Login with missing details
    When i enter the random unregistered email address "boxyboxyboxy@example.com"
    And i enter a random valid password for this account
    And i submit my attempt to login
    Then i should see a login error appear in my browser:
    """
      Please enter an email address and password.
    """

  @Register_temp
  Scenario Outline: Attempted Incorrect Password Login to a registered account
    Given i have previously submitted <number> invalid logins
    When i enter my regsitered account email address
    And i enter a random valid password for this account
    And i submit my attempt to login
    Then i should see one of these error messages in my browser:
    | Feedback                                                                                                       |
    | Sorry your login doesnt match our data. You have 4 more attempts before your account is locked for 30 minutes. |
    | Sorry your login doesnt match our data. You have 3 more attempts before your account is locked for 30 minutes. |
    | Sorry your login doesnt match our data. You have 2 more attempts before your account is locked for 30 minutes. |
    | Sorry your login doesnt match our data. You have 1 more attempts before your account is locked for 30 minutes. |

    Examples:
    | number |
    |   0    |
    |   1    |
    |   2    |
    |   3    |

  @Register_temp
  Scenario: Account lockout after 5 incorrect password attempts
    When i enter my registered account email address
    But i enter an invalid password for the 5th time
    Then i should see an error page in my browser informing me that my account is locked
    And there should be a button to reset my existing password

  @login
  Scenario: Login with remember me set
    When i enter my correct username and password
    And i check the Remember me box on the login form
    And i submit my attempt to login
    Then i should be logged into the My Volkswagen section
    And the remember me cookie should be set in my browser

  Scenario: Link to reset my password
    When i click on the link to go to the reset password form
    Then i should see the form fields load in my browser window

  Scenario: Link to register a new account
    When i click on the link to go to the registration page
    Then i should see the registration form load in my browser

  Scenario: Logging out from my account
    When i enter my correct username and password
    And i submit my attempt to login
    But i then log out from my Volkswagen account
    Then i should find i am no longer signed into my account

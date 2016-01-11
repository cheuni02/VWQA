@Register-2 @my_vw
Feature: Volkswagen Account Registration
  Since we have a Volkswagen Customer account section
  We should ensure that new customers can sign up and register for an account
  And that validation for regsitering customers works correctly

  Background: Visiting the Registration form
    Given i am on the Volkswagen Account registration page

  Scenario Outline: New User Tries to Register without valid details
    Given i enter my name details as <title> <firstname> <surname>
    When i set the email account field to <email>
    And i enter a valid registration Password "Abcd!2345"
    Then i should not be able to complete my registration
    And i should see my a message on the page stating <feedback>

    Examples:
    | title | firstname | surname | email                       | feedback                                                 |
    |       | Toasty    | Tester  | testtesttest992@example.com | Please enter correct title.                              |
    | Mr    |           | Tester  | testtesttest992@example.com | Please enter correct firstname.                          |
    | Mr    | Toasty    |         | testtesttest992@example.com | Please enter correct surname.                            |
    | Mr    | Toasty    | Tester  |                             | We need a contact email address                          |
    | Mr    | Toasty    | Tester  | testtesttest992             | Please include an @ in your email address.               |
    | Mr    | Toasty    | Tester  | testtesttest992@            | Please enter the part of your email that follows the @.  |
    | Mr    | Toasty    | Tester  | testtesttest992@example     | Please enter a correctly formatted email address.        |
    | Mr    | Toasty    | Tester  | @example.com                | Please enter the part of your email that precedes the @. |
    | Mr    | Toasty    | Tester  | test@example.com@com        | Please enter a correctly formatted email address.        |

  Scenario Outline: New User Tries to Register with invalid Password
    Given i enter my name details as Mr Toasty Tester
    And i set the email account field to 'testtesttest992@example.com'
    When i set the password field to <password>
    And i set the confirm password field to <repeat_password>
    Then i should not be able to complete my registration

    Examples:
    | password                     | repeat_password              |
    | Abcd!2345                    |                              |
    |                              | Abcd!2345                    |
    | homer                        | homer                        |
    | HOMER                        | HOMER                        |
    | 12345                        | 12345                        |
    | 12345678                     | 12345678                     |
    | HOMERSIMPSON1                | HOMERSIMPSON1                |
    | homersimpson1                | homersimpson1                |
    | HomerSimpson                 | HomerSimpson                 |
    | BlahBlahBlahBlahBlahBlah9999 | BlahBlahBlahBlahBlahBlah9999 |

  Scenario: User Tries to register with a duplicate email address
    Given i enter my name details as Mr Toasty Tester
    And i set the email account field to 'craig.merrilees@tribalworldwide.co.uk'
    And i enter a valid registration Password "Abcd!2345"
    When i submit my new account registration
    Then i should be returned to the registration form with the following error:
    """
    Sorry, that email is already in use.
    """

  Scenario: User Successfully registers an account
    Given i enter my name details as Mr Toasty Tester
    And i set the email account field to a random unused value
    And i enter a valid registration Password "Abcd!2345"
    When i submit my new account registration
    Then i should see the registration thank you page in my browser

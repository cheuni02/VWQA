@my_vw @Registration-2
Feature: Volkswagen Registration
  As the owner of the VW website
  As the owner of the VW website
  As the owner of the VW website

  Scenario Outline: Validating VW Registration - Negative
    Given I am registering for a new VW account
    When I enter my first name as <title> <firstname> <lastname>
    And I set my email address to <email>
    And I enter a valid <password>
    And I submit my registration
    Then I should find my account is not registered

    Examples:
    | title       | firstname      | lastname      | email         | password      |
    | Mr          |                |               |               |               |
    | Mr          | Test           |               |               |               |
    | Mr          |                | User          |               |               |
    | Mr          |                |               | test@test.com |               |
    | Mr          |                |               |               | testuser123   |
    | Ms          | TestFirstNameTestFirstNameTestF| TestLastNameTestLastNameTestLas | test@test.com | testuser123 |

  Scenario Outline: Validating VW Registration - Invalid Email
    Given I am registering for a new Volkswagen account
    When I enter the name as <title> <firstname> <lastname>
    And I set email address to <email>
    And I enter the valid <password>
    And I submit this for registration
    Then I should find my account has not been registered

    Examples:
    | title       | firstname      | lastname      | email          | password      |
    | Mr          | Test           | User          | test@test.com  | testuser123   |
    | Mr          | Test           | User          | testtesttest   | testuser123   |
    | Mrs         | Test           | User          | test@test      | testuser123   |
    | Dr          | Test           | User          | test@.co.uk    | testuser123   |
    | Miss        | Test           | User          | @test.com      | testuser123   |
    | Ms          | Test           | User          | test@test@test | testuser123   |
    | Mr          | Test           | User          | testü@test.com | testuser123   |

  Scenario Outline: Validating VW Registration - Invalid Password
    Given I am registering a new Volkswagen account
    When I enter their name as <title> <firstname> <lastname>
    And I set their email address to <email>
    And I enter the <password> and <passwordconfirm>
    And I submit
    Then I should find that my account has not been registered

    Examples:
    | title       | firstname      | lastname      | email         | password      | passwordconfirm |
    | Mr          | Test           | User          | test@test.com | testuser123   |                 |
    | Mr          | Test           | User          | test@test.com |               | testuser123     |
    | Mr          | Test           | User          | test@test.com | testuser12    | testuser123     |
    | Ms          | Test           | User          | test@test.com | 1234567       | 1234567         |

  Scenario Outline: Validating VW Registration - Positive
    Given that I am registering for a new VW account
    When I enter my name as <title> <firstname> <lastname>
    And I set the email address to <email>
    And I enter valid <password> with confirmation
    And I submit my registration form
    Then I should find that my account has been registered

    Examples:
    | title       | firstname      | lastname      | email                | password      |
    | Mr          | Test           | User          | test@test.com        | testuser123   |
    | Mrs         | Jürgen         | Schrötter     | test.te_t@test.co.uk | test üser-_:  |
    | Mr          | TestFirstNameTestFirstNameTest | TestLastNameTestLastNameTestLa | test_123@test.de | testuser123 |

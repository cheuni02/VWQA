@email-test
Feature: Testing Email retrieval
  This is a test feature demonstrating email retrieval functionality.
  Please manually send a verification email first!

  Scenario: Email Retrieval Demonstration
    Given i have sent an email verification to my address
    When i check that my verification email is in my inbox
    Then i should find i have a message recieved
    And i should find my message has a verification token for me to use
    

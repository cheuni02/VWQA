@Personalisation @Daily
Feature: Non Personalised My Volkswagen Experience
  In order to ensure that we are running our personalisation pilot correctly
  We need to make sure that the non personalised user flow behaves as expected
  And that users not in the personalised flow are shown the standard VW Content

  Background: Ensuring we are not in the personalised flow
    Given i navigate my browser to the Volkswagen homepage
    And i ensure that i am not using the personalised workflow

  Scenario Outline: Checking Personalisation is disabled for each model
    When i navigate to the MLP Page for <model> on the website
    And i return back to the Volkswagen site homepage
    Then i should see that links to "I want a Volkswagen company car" and "I want a Volkswagen Van" are still displayed

    Examples:
    | model                |
    | up!                  |
    | New Polo             |
    | The Beetle           |
    | Golf                 |
    | The Beetle Cabriolet |
    | The New Golf Estate  |
    | New Jetta            |
    | Golf SV              |
    | e-up!                |
    | Touran               |
    | Passat               |
    | New Scirocco         |
    | Tiguan               |
    | Passat Estate        |
    | Golf Cabriolet       |
    | Volkswagen CC        |
    | Sharan               |
    | Performance Golfs    |
    | e-Golf               |
    | New Touareg          |

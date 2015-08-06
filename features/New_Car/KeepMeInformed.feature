@Daily @vw-plugin-cps-vw-section-new-cars
Feature: Subscribing for more information about a car model
  As the owner of the Volkswagen website
  We need to make sure that customers can subscribe for updates about a given car model
  And that the form to submit my details such as name and email address work as expected

  Background: Visiting the model subscription page
    Given i view the form for subscribing to information about a given car model

  Scenario Outline: Validating Personal Details
    When i set my name as <title> <firstName> <Surname> using the form fields
    And i provide my email address of <email> into the relevant field
    And i click on the submit button to send my form
    Then i should see the <complete> page appear in my browser

    Examples:
    | title | firstName | Surname    | email               | complete   |
    | Mr    | Testy     | Tester     | test123@example.com | Thank You  |
    | Mrs   | Testing   | Testing    | test999@example.com | Thank You  |
    | Miss  |           | Testing    | test999@example.com | Submission |
    | Ms    | Turkey    |            | test999@example.com | Submission |
    | Dr    | Turkey    | Turkinston |                     | Submission |
    | Prof  | Turkey    | Turkinston | test999@example     | Submission |
    | Lord  | Turkey    | Turkinston | test999.com         | Submission |
    | Lady  | Turkey    | Turkinston | test999             | Submission |

  Scenario: Signing up for a car model from the homepage
    Given i visit the Volkswagen homepage as a first time user
    When i click on the navigation link to New Cars at the top of the page
    And i choose the "New Polo" as the model i want to keep informed on
    And i click the relevant link to subscribe to more information about the Polo
    Then i should see the the car information subscription form loaded on the webpage

  Scenario: Completing the form with mandatory only details
    When i enter a default information such as my title and email address
    And i submit the form using the button on the webpage
    Then i should see a thank you page has been loaded in my browser window

  Scenario: Completing the form with optional car details
    When i enter my default personal information to the subscription form
    And i complete the optional car details fields on the page
    And i submit my completed form again using the button on the page
    Then i should see the thank you message appear in my browser window

  Scenario: Completing the form with optional house details
    When i enter my personal details again using the form fields
    And i check the box indicating i would like brochures sent to me for this car model
    And i enter my address details before clicking on the submit button on the page
    Then i should see the thank you submission result page in my browser window

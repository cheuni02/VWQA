@Daily @vw-plugin-cps-vw-section-new-cars @vw-phoenix
Feature: New Car MLP And Navigation
  In order to ensure that the VW Website is working correctly
  We need to ensure that the MLP page for some of the car models Appears correctly
  And that the offers for given car models are present along with other necessary sections

  Background: Viewing all car models
    Given i go to the new car range page to select the car model i want

  Scenario Outline: Checking offers page for car models
    Given i select to view more details of the <model> car
    When i click on the offer present in the main panel of the MLP Page
    Then i should see a page with more details of the offer shown in my browser

    Examples:
    | model         |
    | up!           |
    | Golf SV       |
    | Passat Estate |
    | The Beetle    |
    | Tiguan        |

  Scenario Outline: Checking Explore page for car models
    Given i want to see the MLP page for the <model> car
    When i click on the navigation link to explore
    Then i should see a page load detailing features about the given car model

    Examples:
    | model           |
    | Polo            |
    | Volkswagen CC   |
    | The Beetle      |
    | Golf            |
    | Sharan          |

  Scenario Outline: Viewing more details about a car model
    Given i choose <model> as the model of car i am interested in
    When i click on the nav bar link to the car models page
    Then i should see a page comparing all the derivates for my selected model

    Examples:
    | model            |
    | Golf SV          |
    | e-Golf           |
    | e-up!            |
    | Beetle Cabriolet |
    | Sharan           |

  Scenario Outline: Begin Booking a Test Drive
    Given I have selected a car <model> from the new cars page
    When I click on the Test Drive link in the nav bar
    Then I should see the 2nd step of the Book a Test Drive process

    Examples:
    | model         |
    | New Polo      |
    | Volkswagen CC |
    | The Beetle    |
    | Golf          |
    | up!           |

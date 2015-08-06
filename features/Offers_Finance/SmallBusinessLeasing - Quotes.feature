@Daily @vw-plugin-cps-vw-section-buying-guide
Feature: Small Business Car Quotations
  As We have potential small business customers on the VW Website
  We need to make sure that we can show our customers quotations for all the car models
  And each of the car models should display the correct information beside each trim

  Background: Visiting the small business lease pages
    Given i visit the webpage for viewing information about small business leasing

  @Slow
  Scenario Outline: Viewing Quotations for each car model
    When i select the car model <model> from the list of models i can view quotes for
    Then i should see a panel containing a table of car trims engines and monthly cost
    But if there are multiple pages in the panel and i click through them
    Then i should see the correct data is displayed for all items inside that model

    Examples:
    | model                |
    | up!                  |
    | New Polo             |
    | The Beetle           |
    | Golf                 |
    | Golf SV              |
    | Touran               |
    | The Beetle Cabriolet |
    | Golf Cabriolet       |
    | Golf Estate          |
    | Passat               |
    | New Jetta            |
    | Performance Golfs    |
    | Volkswagen CC        |
    | Passat Estate        |
    | Tiguan               |
    | Sharan               |
    | Touareg              |

  Scenario Outline: Viewing Quotations for each car model
    When i select the car model <model> from the list of unfiltered models
    And i note the number of model trims that should be displayed inside the panel
    And i count the number of table rows presented on each page of the panel
    Then i should find that the number of table rows matches the count displayed in the panel header

    Examples:
    | model                |
    | up!                  |
    | New Polo             |
    | The Beetle           |
    | Golf                 |
    | Golf SV              |
    | Touran               |
    | The Beetle Cabriolet |
    | Golf Cabriolet       |
    | Passat               |
    | New Jetta            |
    | Performance Golfs    |
    | Passat Estate        |
    | Sharan               |
    | Touareg              |

    Scenario: Viewing a Finance Quote on the calculator
      When i select one of the car models from the list on the page
      And i click on one of the availible view Quote links inside the data table
      Then i should find the finance cacluator load in my browser window
      And i should see the type of finance is automatically set to Business
      But i also should not see any nonsense values in the calculator table

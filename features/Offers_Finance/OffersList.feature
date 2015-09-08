@Daily @vw-plugin-cps-vw-section-buying-guide
Feature: Offers Listing Page
  As the owner of the Volkswagen website
  I need to ensure that the main landing page for all the car offers on the website functions properly
  So that potential customers are aware of all the different offers availible on the cars i am trying to sell

  Background: Visiting the main offers page
    Given i am on the list of offers in the buying guide part of the website

  Scenario Outline: Viewing offer details for a selected model
    When i select the <model> car model panel from the list on the page
    Then i should see a page with a list of the different offers any types appear in my browser

    Examples:

    | model                    |
    | up!                      |
    | New Polo                 |
    | The Beetle               |
    | Golf                     |
    | New Jetta                |
    | Golf Estate              |
    | The Beetle Cabriolet     |
    | Golf SV                  |
    | e-up!                    |
    | Touran                   |
    | New Passat               |
    | Tiguan                   |
    | New Passat Estate        |
    | Golf Cabriolet           |
    | Volkswagen CC            |
    | Performance Golfs        |
    | e-Golf                   |
    | Scirocco                 |
    | Touareg                  |

  Scenario: Getting to the offers list from the homepage
    Given i am back on the VW Homepage
    When i click on the navigation link to Offers and Finance
    And i click on the panel to link me to the offers listing page
    Then i should see the list of car models and offers load in my browser

  Scenario: Viewing Finance Options explaination
   When i click on the link to explain the different possible finance options
   Then i should be taken to a landing page with links to explaination pages

  Scenario: Finance Calculator link
   When i click on the button to show the finance calculator page
   Then i should see the finance calculator page load in my browser window

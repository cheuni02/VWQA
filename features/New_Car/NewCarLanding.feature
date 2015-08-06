@Daily @vw-plugin-cps-vw-section-new-cars @vw-phoenix
Feature: New Cars Landing Page
  In order to ensure that our customers can view all of our new cars
  We need to check that for each model shown on the new car landing page has information displayed
  And that each model has relevant pricing shown so we keep our customers informed about VW Cars

  Background: Viewing the new Cars Landing Page
    Given i visit the new car landing page by clicking on the top level navigation link

  Scenario Outline: Checking content of each car
    When i click on the car model named <model> on the new car landing page
    Then i should see a panel containing a context description of the car
    And i should also see the pricing and detailed information of that cars performance

    Examples:
    | model                |
    | up!                  |
    | New Polo             |
    | The Beetle           |
    | Golf                 |
    | The Beetle Cabriolet |
    | Golf Estate          |
    | New Jetta            |
    | Golf SV              |
    | e-up!                |
    | Touran               |
    | Passat               |
    | Scirocco             |
    | Tiguan               |
    | Passat Estate        |
    | Golf Cabriolet       |
    | Volkswagen CC        |
    | Sharan               |
    | Performance Golfs    |
    | e-Golf               |
    | Touareg              |

  Scenario Outline: Changing the order of displayed cars
    When i change the car order filter to <filter> using the select dropdown on the page
    Then i should see <model> appearing as the first car in the list of items

    Examples:
    | filter      | model             |
    | Price       | up!               |
    | Performance | Performance Golfs |
    | Efficiency  | e-Golf            |
    | Size        | up!               |

  Scenario: Viewing the Landing page from the homepage
    Given i am a new VW user on the homepage of the website
    When i click on the New Cars link in the top level nav
    Then i should see the list of Volkswagen car models appear in my browser

  Scenario: Changing View to Horizontal
    When i click the link to view the list of cars as a horizontal strip
    Then i should see the new car listing change and display as a horizontal strip

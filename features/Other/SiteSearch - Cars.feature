@Daily @vw-web-site
Feature: Site Search
  As a customer on the VW UK Website
  I need to be able to search for something that i am looking for
  And we need to ensure that car models appear in the site search as those are most important

  Background: Going to the VW Homepage
    Given i visit the VW.co.uk homepage in my browser

  Scenario Outline: Searching For Car Models
    When i search for the car model called <model_name> in the search box
    Then i should see a panel containing the name of the car i searched for
    And there should be an image along with links to view more information and configure
    And i should see the relevant facets

    Examples:

    | model_name           |
    | up!                  |
    | New Polo             |
    | The Beetle           |
    | Golf                 |
    | The Beetle Cabriolet |
    | New Jetta            |
    | Golf SV              |
    | e-up!                |
    | Touran               |
    | Tiguan               |
    | Passat Estate        |
    | Golf Cabriolet       |
    | Volkswagen CC        |
    | Sharan               |
    | e-Golf               |

  @Disabled
  Scenario: Entering a generic search query
    When i search for "Cars" using the search box on the page
    Then i should see a list of results displayed in my browser

 Scenario: Checking for the owners manual page in search
    When i enter a search query of "Owners Manual" into the search box
    Then i should find a link is present to the correct content

 Scenario: Check that new news results appear
    When i go to the news page and copy the latest news heading
    And i enter this text in the search box and click search
    Then i should get the news result

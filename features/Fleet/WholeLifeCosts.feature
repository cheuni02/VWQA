@Daily @vw-plugin-cps-vw-section-fleet
Feature: Whole life costs page
  Since we also want to show our business and consumer customers how worthwhile our cars are
  We need to make sure we have a page that outlines the cost effectiveness of our cars
  And this page needs to show the correct data for each car model

  Background: Showing the whole life costs information page
    Given i am viewing the whole life costs page on the website

  Scenario Outline: Testing cars on the whole life cost page
    When i select the car model <model> from the horizontal list on the page
    Then i should see a chart containing data representing the costs of that VW car over its lifespan
    And i should also note that the data has been updated in the last two months

    Examples:
    |      model      |
    | Polo Bluemotion |
    | Golf BM         |
    | Jetta BMT       |
    | Golf Estate BMT |

  Scenario: Viewing whole life costs from the homepage
    Given i am on the VW website homepage
    When i click on the primary navigation link to Fleet
    And i click on the button to show calulators and tools
    And i click on the panel to show the whole life costs for bluemotion cars
    Then the whole life costs page should be loaded in my browser

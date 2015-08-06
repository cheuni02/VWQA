@MPV @Daily 
Feature: My Perfect VW - Details
  As the own of the VW website
  Once a customer has chosen their car
  They should then see the correct details and links

  Background:
    Given that I have loaded the gold SV SE details page

  Scenario: Details - Loading
    When I have loaded the page
    Then There should be "4" options on the screen and a configurator link

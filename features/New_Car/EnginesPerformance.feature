@vw-plugin-cps-vw-section-new-cars @Disabled
Feature: Engines & Performance page
  As a prospective owner of a VW
  I want to compare multiple engines of the same model
  And figure out which one is the one for me

  Scenario: Verify navigation from Car range to Engines & Performance page
    Given i am on new car range page
    When i select the "The Beetle" car model that I want
    And i select engine and performance link from mlp navigation
    Then i should land on engines and performance page

  Scenario Outline: Verify the list of engines with their performance
    Given i am viewing the engines and performance page for the model <model>
    When i see the list of engines from the horizontal scroll view
    Then i should be able to select and view the details in the table for each engine

  Examples:
    | model          |
    | up-nf          |
    | golf-sv        |
    | touran-gp-ii   |
    | passat-viii    |
    | phaeton-gp-iii |

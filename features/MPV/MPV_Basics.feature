@MPV @Daily @wip
Feature: My Perfect VW - Basics
  As the owner of the VW website
  On navigating to the new My Perfect Volkswagen Basics page
  The page should load correctly

  Background:
    Given I navigate to the Basics page

  Scenario: Basics - Page Loads with correct items
    Then the number of menu items should be "5"

  Scenario Outline: Basics - Loading the sections
    When I have clicked on the <section> section
    Then there should be <options> options available

    Examples:
    | section     | options  |
    | bodystyle   | 6        |
    | color       | 12       |
    | performance | 3        |
    | transmission| 2        |
    | price       | 19       |

  
  Scenario Outline: Basics - Selecting options in each section
    When I open the <section> panel
    And click all <section> <options> options that are available
    Then only <result> <section> options remain selected

    Examples:
    | section      | options  | result |
    | bodystyle    | 6        | 3      |
    | color        | 12       | 3      |
    | performance  | 3        | 3      |
    | transmission | 2        | 2      |


  Scenario Outline: Basics - Summary of selected options
    When I select <option1> and <option2> from <section>
    And click Close
    Then the <option1> and <option2> are displayed in the summary

    Examples:
    | section      | option1   | option2  | 
    | price        | 15000     | 55000    |
    | bodystyle    | saloon    | coupe    |
    | color        | yellow    | silver   |
    | performance  | petrol    | electric |
    | transmission | auto      | manual   |
    

  Scenario Outline: Basics - I don't mind option
    When I click on the <section> panel
    And click I dont mind 
    Then I am taken to the <next> section
    And no option is selected for <section>

    Examples:
    | section      | next         |
    | bodystyle    | color        |
    | color        | performance  |
    | performance  | transmission |
    | transmission | price        |
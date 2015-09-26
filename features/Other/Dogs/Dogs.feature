@vw-dogs
Feature: VW Dogs Landing Page
  As the owner of Volkswage
  We need to make sure that the special "Dogs" Landing page is usable for our customers
  As it gives a fun way of interacting with the Set of VW Cars on Offer

  Scenario: Visiting the Special VW Page
    Given i have gone back to the Volkswagen Homepage
    When i go to the special Volkswagen Dogs landing page
    Then i should see that the page loads correctly in my browser

  Scenario: Changing car View
    When i click on the button to change view to cars
    Then i should see all of the dog images replaced by their car counterparts
    But if i revert the view back to dogs again
    Then i should see the images return to the previous state

  Scenario Outline: Changing Filter options
    When i change the filter to <filter> using the dropdown box
    Then i should see the first item on the page is still present

    Examples:
    | filter  |
    | Family  |
    | Fun     |
    | Top Dog |

  Scenario: Choosing a dog
    Given i reload the page to reset any changes i have made
    When i select the first item in the list of dogs
    Then i should see links to view more information and sign up for Volkswagen News

Feature: Configured Car Dashboard
  As a potential VW customer browsing the site
  When i have edited and saved a configuration
  It should appear in the My configurations section where i can see more details and actions

    Scenario: My Configurations page
      Given i have logged into my VW account
      And i am on the My cars page
      Then i should be able to click on the My Configurations link
      And i should be able to see the My configurations page

    Scenario Outline: Configured car details
      Given I have logged into my VW account
      When i have gone to the My configurations page
      Then i should be able to see the following <details>

      Examples:
        | details           |
        | Specifications    |
        | My Choices        |
        | Extras            |
        | Standard features |
        | Shortcode         |
        | Offer             |


    Scenario Outline: User Authored
      Given i have a logged into an account with a saved configuration
      When i am on the My configurations page
      Then i should be able to see my configured car
      And further details and <actions> i can take

      Examples:
        | actions              |
        | Book a test drive    |
        | Edit a configuration |
        | Print a brochure     |

    Scenario Outline: No Longer available
      Given i have logged into an account with a saved configuration that is no longer available
      When i get to the My Configurations page
      Then i should see the configuration and a message that says the configuration is no longer available
      And <links> for further actions i can take

      Examples:
        | links           |
        | Reconfigure Car |
        | My Brochure     |

    Scenario: Retailer Authored Including PDF Download
      Given i have configured a car on the showrooms app and have logged in with the account
      When i go to the My cars section
      And click on the My Configurations links
      Then i should see the configured car along with PDF download link

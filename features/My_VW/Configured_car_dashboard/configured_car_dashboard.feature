@configured_car @Daily
Feature: Configured Car Dashboard
  As a potential VW customer browsing the site
  When i have edited and saved a configuration
  It should appear in the My configurations section where i can see more details and actions

    @test
    Scenario: My Configurations page
      Given i have logged into my VW account
      When i am on the My cars page
      Then i should be able to click on My Configurations link
      And i should be able to see My configuration on the page

    Scenario Outline: Configured car details
      Given I have logged into my VW account
      When i have go to the My configurations page
      Then i should be able to see the following <details>

      Examples:
        | details                |
        | my-configured-summary  |
        | my-configured-gallery  |
        | my-configured-spec     |
        | my-configured-feature  |
        | my-configured-standard |
        | my-configured-retailer |
        | my-promo               |
        | dimmy                  |

    Scenario Outline: User Authored
      Given i have a logged into an account with a saved configuration
      When i am on the My configurations page
      And i am viewing my configured car
      Then i should be able to see the book a test drive button
      And the <actions> link for my configured car

      Examples:
        | actions              |
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

    Scenario Outline: Configured Car recovery buttons
      Given i am viewing my configuration
      When i am further down the page
      Then i should see further action <buttons>

      Examples:
        | buttons           |
        | Get a brochure    |
        | Book a test drive |
        | Keep me informed  |
        | Contact Us        |

    Scenario: Specification Section links
      Given i am logged in and on the specification section
      When i check to see if the table of data is present
      Then i should also see links to the Dimensions and Terms and Conditions

    Scenario: Standard features section expanded
      Given i am logged in and the standard features section is present
      When i click on the expand link
      Then i should see the full list of standard features appear

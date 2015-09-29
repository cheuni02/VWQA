@configured_car @Daily @logout
Feature: Configured Car Dashboard
  As a potential VW customer browsing the site
  When i have edited and saved a configuration
  It should appear in the My configurations section where i can see more details and actions

    Background:
      Given I have loaded the My VW section

    Scenario: My Configurations page
      And i have logged into my VW account
      When i am on the My cars page
      Then i should be able to click on My Configured car link
      And i should be able to see My configuration on the page

    Scenario Outline: Configured car details
      And I have logged into my own VW account
      When i have gone to the My configuration page
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

    Scenario: User Authored
      And i have a logged into an account with a saved configuration
      When i am on the My configured car dashboard page
      And am viewing my configured car
      Then i should be able to see the book a test drive button
      And the edit and print configurations links appear


    Scenario Outline: No Longer available
      And i have logged into an account with a saved configuration that is no longer available
      When i get to the My Configuration page
      Then i should see the configuration and a message that says the configuration is no longer available
      And a further action such as <links>

      Examples:
        | links           |
        | Reconfigure Car |
        | My Brochure     |

    Scenario: Retailer Authored Including PDF Download
      And i have configured a car on the showrooms app and have logged in with the account
      When i go to the My cars section
      And click on the My Configurations links
      Then i should see the configured car along with PDF download link

    Scenario Outline: Configured Car recovery buttons
      And i am viewing my configuration
      When i am further down the page
      Then i should see a further action such as <buttons>

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

    Scenario: Configuration Shortcode
      Given i have scrolled down the page
      When i see the the configuration link section
      Then i should see my configuration shortcode

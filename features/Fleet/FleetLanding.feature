@vw-plugin-cps-vw-section-fleet
Feature: Fleet Landing Page
  As part of the site features for business users
  We need to provide details about how to get a fleet
  So that business users can find the best info for purchasing VW Cars

  Background: Viewing the Fleet Landing Page
    Given i visit the fleet landing page by clicking on the top level navigation link

  Scenario: Checking the Welcome slide show
    When i land on the fleet page the slideshow should be visible
    Then i should be able to navigate through slides

  Scenario Outline: Checking the Fleet navigation links and buttons on left side
    When i click on the link named <link> from fleet landing page
    Then i see the page opened having the following title <title>

    Examples:
      | link               | title                                 |
      | reduce             | Reducing your tax : Volkswagen UK     |
      | people             | Our people : Volkswagen UK            |
      | managers           | Fleet manager's guide : Volkswagen UK |
      | small-business     | Why lease from us : Volkswagen UK     |
      | request-demo       | Request a demo : Volkswagen UK        |
      | calculators        | Calculators and tools : Volkswagen UK |

  Scenario: Checking the thumbnails are displayed on Fleet page.
    When i see the additional fleet sections on the page
    Then i should see the correct content for each additional section

  Scenario: Checking you are directed to contact and fleet managers pages
    When i click on fleet team thumbnail from fleet landing page
    Then i should be directed to fleet team page

  Scenario:
    When i click on fleet managers thumbnail on fleet landing page
    Then i should be directed to a new tab with fleet managers page displayed

@vw-plugin-cps-vw-section-fleet @Disabled
Feature: Fleet Manager's Guide
  As part of the site features for business users
  We need to provide guides with industry information and advices on how to manage a fleet
  So that business users can successfully manage their fleets

  Background: Showing the Fleet Manager's Guide page
    Given i am viewing the fleet managers guide page on the website

  Scenario: Checking all required sections are displayed on Fleet Manager's guide page
    Then i should see all the major sections as navigation, title, description and list of guides

  Scenario: Checking if the list of guides in navigation section of Fleet Manager's guide page
    When i check the links to guides from navigation pane
    Then i should see "12" links to guides in navigation pane

  Scenario: Checking the description, download and share buttons on Fleet Manager's guide page
    When i see the small description of fleet managers guide page is displayed
    Then i see the download button of the full managers guide
    And i see the share button of the fleet managers guide page

  Scenario: Checking the list of guides on Fleet Manager's Guide page
    When i see that each link has a title and a more info button
    Then i should see "12" links to guides in the main fleet managers page

  Scenario Outline: Checking the content of each expanded guide
    When i click on the <guide> managers guide link
    Then i should see the relevant content for <guide> managers guide
    But i click on back to top and then on less info and the guide <guide> is closed

  Examples:
    | guide |
    | 1     |
    | 2     |
    | 3     |
    | 4     |
    | 5     |
    | 6     |
    | 7     |
    | 8     |
    | 9     |
    | 10    |
    | 11    |
    | 12    |
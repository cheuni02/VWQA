@Daily  @vw-plugin-cps-vw-section-buying-guide @vw-phoenix
Feature: Buying Guide
  As the owner of the VW Site
  We need to make sure that customers can access the buying guide page
  So that they have some idea about the cars they want to buy

  Scenario: Visiting the Buying Guide
    Given i visit the VW Homepage on the website
    When i click the link to Offers & Finance
    Then i should see the buying guide page load in my browser

  Scenario: VW Offers link
    Given i am currently on the offers and Finance homepage
    When i click the page link to the offers section of the VW Site
    Then i should see the Volkswagen offers page load in my browser

  Scenario: VW Small Business Link
    When i click the page link to view VW Small business offers
    Then i should see a information page with a header "Small Business Leasing Offers"
    And there should be an image and text information on the page

  Scenario: VW Insurance Link
    Given i go back to the Buying Guide landing page
    When i click the page link to show information about VW insurance options
    Then i should see an information page containing details about insurance options
    And i should see 2 other buttons pointing to other pages on the site

  Scenario: VW Motability Link
    Given i return to the buying guide main page to select another option
    When i click the page link to show information about Motability of VW Products
    Then i should see an information page with a header "About motability"
    And there should be an image and 1 other button link displayed on the page

  Scenario: Finance calculator
    Given i return to the buying guide landing page to view more buying options
    When i click on the link to view the finance calculator
    Then the page to select which model i want should load in my browser

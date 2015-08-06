@vw-plugin-cps-vw-section-global
Feature: Homepage
  As the owner of the Volkswagen website
  I need to make sure that my homepage is always present on the website
  Otherwise if our homepage is not working then our customers can not use our website

  Scenario Outline: Homepage primary links
    Given i am on the Volkswagen homepage in my browser
    When i click on the main link displayed on the homepage with text <text>
    Then i should see the correct <section> page load in my browser window

    Examples:
    | text                           | section       |
    | I Want a new Volkswagen        | New Cars      |
    | I Own a Volkswagen             | Owners        |
    | I Want a used Volkswagen       | Used Cars     |
    | I Want a Volkswgen Company Car | New Cars      |
    
  Scenario Outline: Carousel Items
    When i click on the carousel item at the index <index>
    Then i should see a carousel header and text displayed on the homepage
    
    Examples:
    
    | index |
    | 1     |
    | 2     |
    | 3     |
    | 4     |
    
    Scenario: Visiting the VW Homepage
    When i go to the VW UK Website in my web browser
    Then i should see the VW Logo appear on the homepage indicating it has loaded correctly  
  
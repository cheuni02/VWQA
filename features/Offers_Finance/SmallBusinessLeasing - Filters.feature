@Daily @vw-plugin-cps-vw-section-buying-guide
Feature: Small Business Leasing Filters
  As we have potential small business customers of a Volkswagen Cars
  We need to make sure that the small business customers can quickly look for the cars they want
  And they need to be able to obtain quotes for the cars that the want to order on a hire basis

  Background: Visiting the small business leasing webpage
    Given i reset all the filters by going to the small business leasing mainpage

  Scenario Outline: Testing the quotation filters
    Given i count the number of starting cars displayed in the filter box
    When i remove the filter option <filter> from the list by clicking on it
    Then i should have <count> vehicle types left displayed on the page

    Examples:
    | filter       | count |
    | Hatchback    | 09    |
    | Coupe        | 14    |
    | Estate       | 14    |
    | Cabriolet    | 13    |
    | Saloon       | 13    |
    | MPV          | 13    |
    | SUV          | 14    |
    | Door2        | 14    |
    | Door3        | 13    |
    | Door4        | 13    |
    | Door5        | 9     |
    | Petrol       | 14    |
    | Diesel       | 12    |
    | BEV          | 14    |
    | Manual       | 15    |
    | DSG          | 15    |
    | ASG          | 15    |
    | Auto         | 14    |

  Scenario: Visiting the small business leasing page from the homepage
    Given i go back to the VW.co.uk homepage by clicking on the VW logo
    When i click on the top level nav link to offers and finance
    And i click on the secondary nav link to the small business leasing page
    Then i should see the small business page load in my browser window

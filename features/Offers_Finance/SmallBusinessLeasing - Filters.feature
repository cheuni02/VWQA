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
    | Hatchback    | 10    |
    | Coupe        | 15    |
    | Estate       | 15    |
    | Cabriolet    | 14    |
    | Saloon       | 14    |
    | MPV          | 14    |
    | SUV          | 14    |
    | Door2        | 15    |
    | Door3        | 14    |
    | Door4        | 14    |
    | Door5        | 9     |
    | Petrol       | 15    |
    | Diesel       | 12    |
    | BEV          | 15    |
    | Manual       | 16    |
    | DSG          | 16    |
    | ASG          | 16    |
    | Auto         | 15    |

  Scenario: Visiting the small business leasing page from the homepage
    Given i go back to the VW.co.uk homepage by clicking on the VW logo
    When i click on the top level nav link to offers and finance
    And i click on the secondary nav link to the small business leasing page
    Then i should see the small business page load in my browser window

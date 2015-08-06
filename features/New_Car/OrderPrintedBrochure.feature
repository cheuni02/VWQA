@vw-plugin-cps-vw-section-new-cars @Disabled
Feature: Order a printed brochure page
  As a prospective owner of a VW
  I want to discover more details and price list of VW models
  So I want to receive printed brochures of specified models

  Background: Viewing Order a brochure page of a model
    Given i am on Brochure and price list page of the following model "up-nf"
    And i go to Order a brochure page of the selected model

  Scenario Outline: Order brochures for one or multiple car models
    When i include <current_model> the car brochure for the current selected model
    And i select brochures for other <b_number> models on order a brochure page
    And i go to tell us about you page of ordering brochures
    Then i should see the selected brochures of car models in the left side of the page
    And i should be able to select the "<title>" title and fill in the personal details "<first_name>" "<last_name>"
    And i should be able to fill in the contact details "<email>" "<telephone>"
    And i should be able to fill my location details "<house_name>" "<postcode>" "<street_name>" "<street_name_second>" "<town_city>" and "<county>"
    And i should be able to tell about my next car as replacement date "<month>" "<year>", the condition "<condition>" and the ownership "<ownership>"
    And i should be able to tell about my current car as make "<make>" and model "<model>"
    And i should be able to select how to be contacted by email "<email_news>", telephone "<telephone_news>", text message "<message>" and post"<post>"
    And i should be able to select if I don't want to hear from other organisations "<other_organisations>"
    And i should see the privacy policy as a popup on the bottom of order a brochure page
    Then i should be able to submit the request to order the brochures
    And i should be directed to the "<complete>" page
  Examples:
    | b_number | current_model | title | first_name | last_name | email                 | telephone       | house_name | postcode | street_name        | street_name_second | town_city | county      | month    | year | condition | ownership | make | model | email_news | telephone_news | message | post | other_organisations | complete     |
    | 4        | 1             | Mr    | John       | Smith     | email1@testtribal.com | +44 754 2564 12 | house 1    | G2 2JJ   | West George Street |                    | Glasgow   | Lanarkshire | February | 2016 | New       | Private   | VW   | Golf  | yes        | yes            | yes     | yes  | yes                 | confirmation |
    |          | 1             |       |            |           |                       |                 |            |          |                    |                    |           |             |          |      |           |           |      |       |            |                |         |      |                     | tell us      |
    | 6        | 0             | Mrs   |            | Smith Mc  | email2@testtribal.com | 008088025644    | house 2    | g22jj    | street 1           |                    | town      | county      |          |      | Used      | Company   |      |       | no         | no             | yes     | yes  | no                  | tell us      |
    | 5        | 0             | Miss  | John       |           | email3@testtribal.com | 0-123-12333-21  | 123        | N10 1AD  | The Vale           |                    | London    |             |          | 2017 | New       |           | BMW  |       | yes        | no             | no      | no   | yes                 | tell us      |
    | 2        | 1             | Ms    | John Jr    | Doe       |                       | 123 123 0-1234  | house      | N10 1BB  | Bedford            | Close 12           | london m  |             | August   |      |           | Private   |      | 320M  | no         | no             | yes     | no   | no                  | tell us      |
    | 1        | 1             | Dr    | John       | McArthur  | email_2@testtribal.de | 1230.1233 a     | 12         | NW11 0AF | Monks              | Way                | London    | England     |          |      | Used      |           |      |       |            |                |         |      |                     | tell us      |
    | 3        | 0             | Prof  | James      | Antoine   | email4@testtribal.com |                 |            | NW11 0AE | Gardens            |                    | LONDON    |             |          |      |           |           |      |       |            |                |         |      |                     | tell us      |
    |          | 1             | Lady  | Jürgen     | Schrötter | email6@testtribal.com | +23423 234234 1 | Bänker     | G2 2JJ   | Cömpäny            | Cömpäny            | Köln      | Köln        |          |      |           |           | Kia  | Cee'd |            |                |         |      |                     | confirmation |
    |          | 1             | Lord  | TestMaximum length of the field | TestMaximum length of the field| email5@testtribal.com | 123123123123| Test maximum length of the field so  it  should not| NW11 0AE | Test maximum length of the field so it should not exceed more than one hundred  characters  per  line | Test maximum length of the field so it should not exceed more than one hundred  characters  per  line | Test maximum length of the field so  it  should not | Test maximum length of the field so it should not exceed more than one hundred  characters  per  line | | | | | | | | | | | | tell us|

  Scenario: Check the Back button on Order printed brochures pages
    When i am on tell us about you page of ordering brochures
    And i click on Back button from the bottom of the tell us about you page
    Then i should be directed back to select the car models that i want brochures for
    And i click on Back button from select brochures page
    Then i should be directed to order a brochure main page

  Scenario: Verify that at least one brochure should be selected to complete ordering a brochure
    When i see the maximum other brochures i can select
    And i unselect the car brochure and price list of the chosen car model
    Then i should not be able to go to Tell us page
    And i should see the maximum number of brochures to order is increased with one
    But i select brochures for different models
    Then i should be able to land on Tell us page of Ordering a brochure

  Scenario: Verify that the images of car models are displayed on Order a brochure page
    And i see the image of the selected car model on top left of Ordering a brochure page
    And i see the description of the selected car model on top of the page
    And i expand the section with the other car models
    Then i should see also the description, include checkbox and image of each car model on the page
    But i collapse the other car models section
    And the car models should be hidden


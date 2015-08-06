@Daily @vw-plugin-cps-vw-section-about-us
Feature: Contact Us Email Form
  As part of making sure our customers can interact with the VW Website
  We need to ensure that it is possible to send emails using the website
  And that this functionality is correctly implemented through the contact us email form on the website

  Background: Visitng the Contact Us Email Page
    Given i am on the Contact Us email page
    And i reveal the email panel on the page

  Scenario Outline: Completing the email form with data
    When i enter my name as <title> <first_name> <surname>
    And i set my telephone number to <telephone> with an email address of <address>
    And i enter a sample test message to the email panel before sending my message
    Then i should see <message> detailing me about the success of my message

    Examples:
    | title | first_name | surname    | telephone  | address                                  | message |
    | Mr    | Test       | Test       | 0123456789 | test@example.com                         | success |
    | Mrs   | Test       | Test       | 0123456789 | test@example.com                         | success |
    | Miss  |            | Test       | 0123456789 | test@example.com                         | failed  |
    | Ms    | Test       |            | 0123456789 | test@example.com                         | failed  |
    | Dr    | Test       | Test       |            | test@example.com                         | failed  |
    | Prof  | Test       | Test       | 0123456789 |                                          | failed  |
    | Lord  | Test       | Test       | 0123456789 | test@example                             | failed  |
    | Lady  | Test       | Test       | 0123456789 | test.com                                 | failed  |
    | Sir   | Gowtham    | Selvarajah | 0123456789 | Gowtham.Selvarajah@tribalworldwide.co.uk | success |


  Scenario: Testing Retailer Find by location
   When i enter my local postcode as "UB6 7HA" to the find by location field
   And i click on the go button beside this field
   Then i should be shown the retailer search results using the find a retailer system

  Scenario: Checking Contact Us Page loaded
   Given i return to the main VW Website homepage
   When i select the footer link leading to the contact us page
   Then i should see the correct page load in my browser


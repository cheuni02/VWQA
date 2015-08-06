@vw-plugin-cps-vw-section-owners
Feature: Servicing - Service Promise
  As the VW site owner
  I'd like to display the promises that we give to the customer
  When they make use of our servicing plans

  Background:
    Given that I have opened the service promises page

  Scenario: Page Load
    Then the page should be loaded successfully

  Scenario Outline: Showing promises
    When I click on link <link>
    Then the <promise> should appear

  Examples:

  | link | promise                                            |
  | 1    | We’ll fit exterior bulbs and wiper blades free     |
  | 2    | We'll match any like-for-like quote within 5 miles |
  | 3    | A range of convenience services to suit your needs |
  | 4    | We offer free visual health checks                 |
  | 5    | Free car wash and vacuum                           |
  | 6    | We offer ‘real’ value for money                    |
  | 7    | Free road test with a technician if required       |
  | 8    | We offer service plans                             | 
  | 9    | No one knows your Volkswagen better than we do     |

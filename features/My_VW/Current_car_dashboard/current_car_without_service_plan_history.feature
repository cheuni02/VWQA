@my_vw @Current-Car-Dashboard
Feature: Current car dashboard
  As a user logged in the My VW site
  I want to see a page with important information about my current car

  @login_single_car_user
  Scenario: My car hero section
    Given I am on the Volkswagen Homepage
    When I login into my account
    Then I will be logged into my account
    And a default picture of my last added car type golf is displayed
    And my last added car name is GOLF
    And I will also see a camera icon on the page

  Scenario: My Service Retailer Module
    Then I will see a map loaded displaying my retailer location
    And I will also see the following retailer address details displayed:
      | Ipswich Volkswagen | Sproughton Road | Ipswich | IP1 5AN |
    And I will see the following contact details:
      | Phone        | Fax          | Email                   |
      | 01473 240800 | 01473 240088 | tribalddbtech@gmail.com |

  Scenario: My Retailer Link
    When I click on the link to view my retailers website
    Then I will see the retailer page for Ipswich Volkswagen
    When I select browser back button
    Then I will be logged into my account
    And a default picture of my last added car type golf is displayed
    And my last added car name is GOLF

  Scenario: My Service History Notification section without information as my account is not validated
    When I scroll to my service history and plans
    Then I will see a message prompting me to enter my postcode for more information

  Scenario Outline: Promotions offered
    When I scroll to promotions offered
    Then I will see the <promotions> offered
    When I select the <promotions> offering
    Then I will be on the correct page related to the <promotions>
    When I select browser back button
    Then I will be logged into my account

    Examples:
      | promotions            |
      | Fixed price servicing |
      | Extended warranty     |
      | Accessories           |

  Scenario Outline: Need help section
    When I scroll to need help section
    Then I will see the need help search field
    And the following <links> sections are present
    But when I click on find out more <links>
    Then the correct page related to <links> will be loaded
    When I select browser back button
    Then I will see the need help search field

    Examples:
      | links                   |
      | Owner's manual          |
      | Warning lights          |
      | How tos                 |
      | Breakdown and insurance |

  Scenario Outline: Need help search
    When I search for <query> in the need help section
    Then I should see the Need help page
    And I will get <results> for my searched <query>
    When I select browser back button
    Then I will see the need help search field

    Examples:
      | query     | results |
      | breakdown | true    |
      | insurance | true    |
      | b34f      | false   |

  Scenario Outline: Recovery zone section
    When I scroll to the bottom of the page
    Then the <button> should appear for the user
    When I select the footer <button>
    Then I will be on the <button> page
    When I select browser back button
    Then I will see the need help search field

    Examples:
      | button           |
      | Book a service   |
      | Keep me informed |
      | Contact Us       |

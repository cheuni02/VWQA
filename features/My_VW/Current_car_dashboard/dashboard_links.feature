@my_vw @Current-Car-Dashboard
Feature: Current car dashboard
  As a user logged in the My VW site
  I want to see a page with important information about my current car

  Background: Add a car for a non DBG matched user
    Given a car with registration EJ62MMO and display name GOLF is added to my account
    When I login into my account
    Then I will be logged into my account

  @add_car_user @delete_added_car
  Scenario: My car hero section
    Given a default picture of my last added car type golf is displayed
    And my last added car name is GOLF
    And I will also see a camera icon on the page

  @add_car_user @delete_added_car
  Scenario: My Service Retailer
    Given I scroll to my preferred retailer
    Then I will see a map loaded displaying my retailer location
    And I will also see the following retailer address details displayed:
      | Name               | Address         | Town    | Postcode |
      | Ipswich Volkswagen | Sproughton Road | Ipswich | IP1 5AN  |
    And I will see the following contact details:
      | Phone        | Fax          | Email                   |
      | 01473 240800 | 01473 240088 | tribalddbtech@gmail.com |

  @add_car_user @delete_added_car
  Scenario: My Retailer Link
    Given I scroll to my preferred retailer
    When I click on the link to view my retailers website
    Then I will see the retailer page for Ipswich Volkswagen
    When I select browser back button
    Then I will be logged into my account
    And a default picture of my last added car type golf is displayed
    And my last added car name is GOLF

  @add_car_user @delete_added_car
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

  @add_car_user @delete_added_car
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

  @add_car_user @delete_added_car
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

  @add_car_user @delete_added_car
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

  @add_car_user @delete_added_car
  Scenario: My Service History Notification section without information as my account is not validated
    Given I scroll to my service history and plans
    Then I will see a message Please check or update your address to enable this feature in service history and plans section

    When I click on enable service history and plans service feature
    Then I'm asked for Just a few details from you... to update my address

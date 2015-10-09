@current_car @Daily @login @my_vw
Feature: Current car dashboard
  As a user logged in the My VW site
  I want to see a page with important information about my current car

    Background:
      Given that i have logged in to my account

    Scenario: Current car dashboard
      When the current car dashboard page has loaded
      Then I should be greeted with my current car dashboard and my name

    Scenario: Camera icon
      When I click on the camera icon
      Then the system file selector is displayed to choose a photo

    Scenario Outline: My Service gurantee module
      Given the service gurantee module is present on the page
      When i click on a <gurantee> link
      Then i should be taken to the relevant <page>

      Examples:
        | gurantee                               | page                    |
        | /owners/service-promise                | service-promise         |
        | /owners/servicing/what-wecheck-and-why | what-we-check-and-why    |
        | /owners/volkswagengenuine-parts        | volkswagen-genuine-parts |

    Scenario: My Service history
      When i am on the service history module
      Then i should see my vehicles service history

    Scenario: My Plans
      When i am on the my plans section
      Then i should see any plans that i have

    Scenario Outline: Promo Module
      When i am on the promo modules section
      Then i should see the <promotions> promotion
      And the promotion headline

      Examples:
        | promotions            |
        | Fixed price servicing |
        | Extended warranty     |
        | Accessories           |

    Scenario Outline: Need help module
      When i am on need help module
      Then i should see the need help search bar
      And the following <useful_links> section appears

      Examples:
        | useful_links            |
        | Owner's manual          |
        | Warning lights          |
        | How tos                 |
        | Breakdown and insurance |

    Scenario Outline: Need help search
      When i search for <help> in the need help section
      Then i should get a <result> from my need help search

    Examples:
      | help      | result |
      | breakdown | pass   |
      | insurance | pass   |
      | b34f      | fail   |

    Scenario Outline: Preferred Retailer
      When i am on the Current dashboard
      Then i should see my preferred retailer
      And the <links> link in the box

      Examples:
        | links            |
        | View in maps     |
        | Retailer website |

    Scenario Outline: Recovery zone
      When i scroll to the bottom of the page
      Then the <buttons> button should appear for the user

      Examples:
        | buttons          |
        | Book a service   |
        | Keep me informed |
        | Contact Us       |

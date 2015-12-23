@my_vw @Service-Booking-2
Feature: Service booking Step 2 My details
  As a Volkswagen car owner i want to be able to book a service
  I should be able to complete Step 1 in book a service and be taken to Step 2
  where i will need to fill in My personal details

  Scenario: Guest has completed Step 1 and their details are present in summary
    Given I have completed Step 1
    When I select Next - My details
    Then Step 2 of book a service has loaded
    Then I will see step 1 details in summary

  Scenario: Guest tries to move onto next step without completing all their personal details form
    Given I select Next - Select retailer
    Then  I will see feedback that my personal details are incomplete with:
      | Feedback                      |
      | Please enter a title          |
      | Please enter a first name     |
      | Please enter a surname        |
      | Please enter a phone number   |
      | Please enter an email address |
    And  I will see feedback that my address is incomplete with:
      | Feedback                            |
      | Please enter a postcode             |
      | Please enter a house number or name |
      | Please provide your address         |
      | Please provide your city            |

  Scenario Outline: Guest tries to move onto next step without completing some of their personal details
    Given I select my <title>
    And I fill in my personal details <first_name>, <last_name>, <mobile> and <email>
    When I select Next - Select retailer
    Then  I will see <feedback> that my personal details are incomplete

    Examples:
      | title | first_name | last_name | mobile      | email                    | feedback                      |
      |       | Test       | Tester    | 07889093223 | tribaltester@outlook.com | Please enter a title          |
      | Mr    | Test       |           | 07889093223 | tribaltester@outlook.com | Please enter a surname        |
      | Mr    | Test       |           | 07889093223 | tribaltester@outlook.com | Please enter a surname        |
      | Mr    |            | Tester    | 07889093223 | tribaltester@outlook.com | Please enter a first name     |
      | Mr    | Test       | Tester    |             | tribaltester@outlook.com | Please enter a phone number   |
      | Mr    | Test       | Tester    | 07889093223 |                          | Please enter an email address |

  Scenario: Guest tries to move onto next step with invalid information for their personal details
    Given I select my Dr
    And I fill in my personal details first%name , last%name, mobile and email
    When I select Next - Select retailer
    Then  I will see feedback that my personal details are incomplete with:
      | Feedback                                                    |
      | Illegal characters entered. Please remove and submit again. |
      | Illegal characters entered. Please remove and submit again. |
      | Please enter a valid phone number                           |
      | Please enter a valid e-mail address                         |


  Scenario Outline: Guest tries to move onto next step without completing some of their address details
    Given I fill in my address information <postcode>, <house_no>, <address_line1> and <city>
    When I select Next - Select retailer
    Then I will see <feedback> that my address details are incomplete

    Examples:
      | house_no | postcode | address_line1       | city   | feedback                            |
      | 12       |          | Bishops bridge road | London | Please enter a postcode             |
      | 12       | W2 6AA   |                     | London | Please provide your address         |
      | 12       | W2 6AA   | Bishops bridge road |        | Please provide your city            |
      |          | W2 6AA   | Bishops bridge road | London | Please enter a house number or name |

  Scenario Outline: Guest tries to move onto next step with incorect postcode
    Given I fill in the postcode with <text>
    When I select postcode lookup
    Then I will see Please enter a valid postcode. error message
    Examples:
      | text   |
      | text   |
      | EB10TR |
      | 12345  |

  Scenario: Guest successfully looks up their address
    Given I fill in the postcode with LL61 6SH
    When I select postcode lookup
    Then my address details will be populated:
      | Address Line 1 | City                 | County  |
      | Newborough     | LLANFAIRPWLLGWYNGYLL | Gwynedd |

  Scenario: Guest successfully completes their personal details and address
    Given I select my title Dr
    And I fill in my personal details John, Doe, 07889093223 and john_doe@tribalworldwide.com
    And I fill in my address information G2 3PS, 1, Hope Street and GLASGOW
    When I select Next - Select retailer
    Then I will see my personal details in summary:
      | Title | Name | Surname | Mobile      | Email                        |
      | Dr    | John | Doe     | 07889093223 | john_doe@tribalworldwide.com |
    And I will see my address details in summary:
      | House No | Street      | City    | Postcode |
      | 1        | Hope Street | GLASGOW | G2 3PS   |

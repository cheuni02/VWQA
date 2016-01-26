@my_vw @Service-Booking-2
Feature: Service booking Step 2 My details
  As a Volkswagen car owner i want to be able to book a service
  As a guest I should be able to complete Step 1 in book a service and be taken to Step 2
  where i will need to fill in My personal details

  @login_Current_User @clear_cookies
  Scenario: User has logged into service booking and Step 2 personal details are pre populated
    Given Step 1 is complete after I have logged in
    When I select Next - My details
    Then Step 2 of book a service has loaded
    And I will see my personal details pre-populated

    When I select edit my personal details
    And I update mobile field in personal details

    When I select edit my address details
    And I update postcode field in address section
    And I select postcode lookup
    And I update house name/number field in address section
    And I update address1 field in address section
    And I update city field in address section

    And I select Next - Select retailer

    Then Step 3 of book a service has loaded
    And my personal details will be displayed in summary
    And my address details will be displayed in summary

  @login_complete_details_user @clear_cookies
  Scenario: User has logged into service booking and Step 2 all details are pre populated
    Given Step 1 is complete after I have logged in
    And I enter a vehicle valid registration VU12WGE
    And I click lookup button to find my registration

    When I select Next - My details
    Then my personal details will be displayed in summary
    And my address details will be displayed in summary

    When I select edit my personal details
    Then I will see my personal details pre-populated

    When I select Next - Select retailer
    Then my personal details will be displayed in summary
    And my address details will be displayed in summary

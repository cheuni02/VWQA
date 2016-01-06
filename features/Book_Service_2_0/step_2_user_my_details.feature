@my_vw @Service-Booking-2
Feature: Service booking Step 2 My details
  As a Volkswagen car owner i want to be able to book a service
  As a guest I should be able to complete Step 1 in book a service and be taken to Step 2
  where i will need to fill in My personal details

  @login_Current_User
  Scenario: User has logged into service booking and Step 2 personal details are pre populated
    Given Step 1 is complete after I have logged in
    When I select Next - My details
    Then Step 2 of book a service has loaded
    And I will see my personal details pre-populated

    When I update mobile number field in personal details
    And I update postcode field in address section
    And I select postcode lookup
    And I update house name/number field in address section
    And I select Next - Select retailer

    Then I will be on step 3 with my personal details in summary
    And my address in summary
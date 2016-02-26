Feature: Reporting - OSB bookings and emissions bookings (VWOSBEB-8)
  As a VW CRM manager
  I want to Receive a weekly report on OSB and emissions fixes
  So that I can keep track of the progress in getting the fix rolled out to customers

Background: pre-req
  Given the customer has selected a retailer from postcode : AAAA
  And has entered vehicle registration number: BBBB
  And the user's car is on the affected list and he has provided the VIN

Scenario: customer books service with OSB on start of week 1
  Given user already in form, searched for retailer and provided VIN
  When I get to the “Select work” step on the OSB
  And select Emissions fix at "Select work"
  And select date and time at "Select date"
  And provide Customer 1's details at "Your details"
  And Confirms Booking at "Review & Confirm"
  Then User should get a booking email
  And his details stored

Scenario: customer books service with EMISSIONS FIX on start of week 1
  Given user already in form, searched for retailer and provided VIN
  When I get to the “Select work” step on the OSB
  And select Emissions fix at "Select work"
  And select date and time at "Select date"
  And provide Customer 1's details at "Your details"
  And Confirms Booking at "Review & Confirm"
  Then User should get a booking email
  And his details stored

Scenario: VW CRM manager obtains the report straight after booking made on start of week 1
  Given I have logged on the the VW reports system as a VW CRM manager
  And Customer has made booking with OSB and Emissions fix
  And I have received the OSB report for that customer
  Then I should be able to see report with fields : week number, number of OSBs, number of emissions fixes booked

Scenario: car owner has made a few more OSB bookings during week 1
  Given user already in OSB, searched for retailer and provided VIN
  And books n more OSBs

Scenario: car owner has made a few more Emission Fix bookings during week 1
  Given user already in OSB, searched for retailer and provided VIN
  And books m more Emission Fix bookings

Scenario: VW CRM manager obtains the report straight after booking made on start of week 2
  Given I have logged on the the VW reports system as a VW CRM manager
  And Customer has made booking a few more bookings with OSB and Emissions fix during week 1
  Then I have received the update report for that customer with (n + 1) and (m + 1) bookings for OSB and Emission fixes respectively



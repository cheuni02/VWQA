Feature: OSB Emissions Fix - Capture customer data & provide as monthly report (VWOSBEB-7)
  As a VW CRM manager
  I want to capture data of all OSB booking customers
  So that I can identify orphaned customers and add them to the CRM system

Background: pre-req: customer provides the VIN code
  Given user selects 'retailer 1' from "1. Choose retailer" (any RTC / NON RTC retailer)
  And a car registration is provided at stage "2. Your vehicle" which is an affected car

Scenario: customer books service WITH Emissions fix
  When I select any service selected at "3. Select work"
  And select date/time and 'Emissions Fix' at "4. Select date"
  And provide Customer 1's details at "5. Your details"
  And Confirms Booking at "6. Review & Confirm"
  Then User should get a booking email

Scenario: customer books service WITHOUT Emissions fix
  When I select any service selected at "3. Select work"
  And select date/time and DON't select 'Emissions Fix' at "4. Select date"
  And provide Customer 1's details at "5. Your details"
  And Confirms Booking at "6. Review & Confirm"
  Then User should get a booking email

Scenario: VW CRM manager should recieve file for customer with a booked service WITH Emissions fix
  Given the customer has booked the service WITH Emissions fix
  When I log in to the email as the VW manager 'Tom Warren'
  Then I should see an email with an attached spreadsheet for customer's booking
  And  the file when opened has these fields: title, surname, first name, postal address, telephone number, marketing permissions, Reg, booked an emissions fix (YES)

Scenario: VW CRM manager should recieve file for customer with a booked service WITHOUT Emissions fix
  Given the customer has booked the service WITHOUT Emissions fix
  When I log in to the email as the VW manager 'Tom Warren'
  Then I should see an email with an attached spreadsheet for customer's booking
  And  the file when opened has these fields: title, surname, first name, postal address, telephone number, marketing permissions, Reg, booked an emissions fix (NO)


  # no need for CRM
  # spreadsheet report with columns eg user, address, emisions fix?



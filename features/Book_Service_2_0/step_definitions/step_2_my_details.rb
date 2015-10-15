Given /^i have completed Step 1$/ do
  @service_booking_2 = site.service_booking.step2
  @service_booking = site.service_booking.step1
  @service_booking.visit
  @service_booking.page_loaded?
end

And /^click the next My details button$/ do
  @service_booking.click_step_2_button
end

When /^Step 2 of book a service has loaded$/ do
  @service_booking_2.page_loaded?
end

Then /^i should see the step 1 details above$/ do
  raise AssertionError, "Step 1 details not present" unless @service_booking_2.car_details_section_present?  
end

When /^i am on Step 2 of book a service$/ do
  site.my_vw.login.visit
  site.my_vw.login.login(@account[0],@account[1])
  @service_booking.visit
  @service_booking.click_step_2_button
  @service_booking_2.page_loaded?
end

Then /^i should see my personal details and address cards already populated$/ do
  @service_booking_2.click_edit_links
  raise AssertionError, "Empty field present" unless @service_booking_2.personal_details_populated? == true && @service_booking_2.address_details_populated? == true
end

When /^the Step 2 page of book a service has loaded$/ do
  @service_booking_2.page_loaded?
end

Then /^i should be able to see Step 2 where i can fill in my personal details$/ do
  raise AssertionError, "Personal details panel not present" unless @service_booking_2.page_loaded?
end

When /^i click the edit link on the personal details card$/ do
  @service_booking_2.page_loaded?
  @service_booking_2.click_edit_personal_details_link
end

And /^i fill in the my (.*), (.*), (.*) and (.*)$/ do |first_name, last_name, mobile, email|
  @service_booking_2.enter_personal_details(first_name, last_name, mobile, email)
end

Then /^i should get a (.*) message if any details are not valid$/ do |message|
  pending #Validation not implemented yet
end

When /^i click the edit link on the Address card$/ do
  @service_booking_2.page_loaded?
  @service_booking_2.click_edit_address_details
end

And /^i fill in the required information such as (.*), (.*), (.*) and (.*)$/ do |house_no, postcode, address_line1, city|
  @service_booking_2.enter_address_details(house_no, postcode, address_line1, city)
end

Then /^i should see an (.*) message if details need to be completed$/ do |message|
  pending #Validation not implemented yet
end

Given /^i have completed Step 1 of book a service$/ do
  @service_booking_3 = site.service_booking.step3
  @service_booking = site.service_booking.step1
  @service_booking.do_step_1
end

And /^completed Step 2 of service booking$/ do
  @service_booking_2 = site.service_booking.step2
  @service_booking_2.do_step_2
end

When /^i am on the Step 3 retailer page$/ do
  site.my_vw.login.visit
  site.my_vw.login.login(@account[0],@account[1])
  @service_booking.visit
  @service_booking.page_loaded?
  @service_booking.click_step_2_button
  @service_booking_2.page_loaded?
  @service_booking_2.click_step3_button
  @service_booking_3.page_loaded?
end

Then /^i should see my retailer already chosen in the retailer card$/ do
  raise AssertionError, "Currently selected retailer not present" unless @service_booking_3.retailer_selected_present?
end

When /^step 3 choose retailer page has loaded$/ do
  @service_booking_3.page_loaded?
end

Then /^i should be able to choose my retailer$/ do
  raise AssertionError, "Retailer panel not present" unless @service_booking_3.retailer_panel_present?
end

Given /^i am on the Step 3 page$/ do
  step 'step 3 choose retailer page has loaded'
end

And /^i have clicked on the edit link in the My retailer card$/ do
  @service_booking_3.click_retailer_edit_link
end

When /^i enter a location (.*) to see the closest retailer$/ do |location|
  @service_booking_3.enter_retailer_location(location)
end

And /^click lookup$/ do
  @service_booking_3.click_location_lookup_button
end

Then /^i should be able to see a list of retailers appear$/ do
  raise AssertionError, "Retailer list not present" unless @service_booking_3.retailer_list_present?
end

And /^i should also be able to view a map view of the closest retailers$/ do
  pending #not implemented yet
end

When /^i click on the edit link in the My retailer card$/ do
  step 'step 3 choose retailer page has loaded'
  step 'i have clicked on the edit link in the My retailer card'
end

And /^i input a invalid location such as (.*) in the field$/ do |invalid_location|
  @service_booking_3.enter_invalid_inputs(invalid_location)
  @service_booking_3.click_location_lookup_button
end

Then /^i should see an error message$/ do
  raise AssertionError, "No error message present" unless @service_booking_3.no_retailer_error_message_present?
end

Given /^i am on the Step 3 page of book my service$/ do
  step 'step 3 choose retailer page has loaded'
end

And /^i am on the edit my retailer details view$/ do
  step 'i have clicked on the edit link in the My retailer card'
end

When /^i enter a retailer (.*)$/ do |name|
  @service_booking_3.enter_retailer_name(name)
end

Then /^i should be able to select a retailer in the dropdown$/ do
  raise AssertionError, "no dropdown present" unless @service_booking_3.retailer_dropdown_visible
  @service_booking_3.click_retailer_in_dropdown
end

And /^see the option to select it$/ do
  @service_booking_3.click_service_radio_button
end

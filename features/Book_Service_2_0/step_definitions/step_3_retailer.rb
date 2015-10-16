Given /^i have completed Step 1 and 2$/ do
  @service_booking_3 = site.service_booking_step3
  @service_booking = site.service_booking.step1
  @service_booking.visit
  @service_booking.page_loaded?
  @service_booking.click_step_2_button
end

And /^click the next Retailer button$/ do
  @service_booking_2 = site.service_booking.step2
  @service_booking_2.click_step3_button
end

When /^i am on the Step 3 retailer page$/ do
  @service_booking_3.page_loaded?
end

Then /^i should see my retailer already chosen in the retailer card$/ do
  raise AssertionError, "Currently selected retailer not present" unless @service_booking_3.retailer_selected_present?
end

When /^step 3 choose retailer page has loaded$/ do
  step 'i am on the Step 3 retailer page'
end

Then /^i should be able to choose my retailer$/ do
raise AssertionError, "Retailer panel not present" unless @service_booking_3.retailer_panel_present?
end

Given /^i am on the Step 3 page$/ do
  step 'i am on the Step 3 retailer page'
end

And /^i have clicked on the edit link in the My retailer card$/ do
  @service_booking_3.click_retailer_edit_link
end

When /^i enter a retailer location (.*)$/ do |location|
  @service_booking_3.enter_retailer_location(location)
end

And /^click lookup$/ do
  @service_booking_3.click_location_lookup_button
end

Then /^i should be able to see a list of retailers appear$/ do
  pending
end

And /^i should also be able to view a map view of the closest retailers$/ do
  pending
end

Given /^i am on the Step 3 page of book my service$/ do
  step 'i am on the Step 3 retailer page'
end

And /^i am on the edit my retailer details view$/ do
  step 'i have clicked on the edit link in the My retailer card'
end

When /^i enter a retailer (.*)$/ do |name|
  @service_booking_3.enter_retailer_name(name)
end

Then /^i should be able to select a retailer in the dropdown$/ do
  raise AssertionError, "no dropdown present" unless @service_booking_3.click_retailer_in_dropdown
end

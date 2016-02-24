Given /^i have selected a location for a service and have entered my car details$/ do
  @serviceStep3 = site.book_service.booking_step3
  @serviceStep3.visit
  @serviceStep3.expand_work_list_option
end

When /^i do not select a service item and try to continue to the next page$/ do
  @serviceStep3.click_next_step
end

Then /^i should see an error on the page requesting to select an item$/ do
  errors = @serviceStep3.getFormErrors
  fail AssertionError, 'Unexpected number of form errors displyed (Expected 0)' unless errors.length > 0
end

When /^i select the 3rd radio button on the page so that i can get my car to have an MOT$/ do
  @serviceStep3.select_MOT_test
end

Then /^i should see the price information on the page update to the correct value$/ do
  expected_price = @serviceStep3.get_MOT_price
  shown_price = @serviceStep3.get_price

  fail AssertionError, "Service Price total did not update when MOT Option selected (Expected #{expected_price}, Got: #{shown_price})" unless shown_price =~ /#{expected_price}/i
end

When /^i select to have an air conditioning refresh done on my car$/ do
  @serviceStep3.select_aircon_refresh
end

And /^i opt in to having the brake fluid changed on my car$/ do
  @serviceStep3.select_brake_fluid_change
end

Then /^i should see the price update to "(.*)" with the new information$/ do |price|
  fail AssertionError, "Service Price total when options were selected (Expected #{price}, Got: #{@serviceStep3.get_price})" unless @serviceStep3.get_price =~ /#{price}/i
end

When /^i select to have my my cars front and rear brake pads maintained$/ do
  @serviceStep3.select_front_brake_pad_service
  @serviceStep3.select_rear_brake_pad_service
end

And /^i select to have a battery replacement performed on my car$/ do
  @serviceStep3.select_battery_replacement
end

Then /^i should see the total price message$/ do
  # raise unless @serviceStep3.get_price =~ /#{price}/i
  fail AssertionError, 'Expected Approximate total price text to be present, text could not be found!' unless @serviceStep3.total_price_text.present?
end

And /^i should also see a message that the price is dependant on a quotation$/ do
  fail ElementNotPresentError, 'Price quotation message header element was not displayed' unless @serviceStep3.quotation_header_present?
end

When /^i enter some additional information about my repair to the service selection form$/ do
  @serviceStep3.set_additional_info(SecureRandom.base64(100))
end

And /^i select some service options from the list on the page$/ do
  step 'i select the 3rd radio button on the page so that i can get my car to have an MOT'
  # step "i select to have my my cars front and rear brake pads maintained"
end

And /^i proceed to the next stage of the service booking form$/ do
  @serviceStep3.click_next_step
end

Then /^i should see the form to select the date of my service present in my browser$/ do
  fail PageNotLoadedError, 'Step 4 of book a service was not loaded!' unless site.book_service.booking_step4.page_loaded?
end

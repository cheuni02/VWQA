Given /^i complete all previous required steps to book my car service$/ do
  @service_booking = site.service_booking
  @service_booking.step1.do_step_1
  @service_booking.step2.do_step_2
  @service_booking.step3.do_step_3
  @service_booking.step4.do_step_4
  @service_booking_5 = @service_booking.step5
  @service_booking_5.wait_for_page
end

When /^i select the first available date in the table$/ do
  @service_booking_5.select_date_available
end

Then /^i should find that my service booking date is locked in$/ do
  raise ValidationError, "Unable to select an available date" unless @service_booking_5.date_active?
end

When /^i click on the right arrow in the calender table$/ do
  @startmonth = @service_booking_5.get_calender_month
  @service_booking_5.click_next_month
end

Then /^i should see the month that i am selecting update$/ do
  raise ValidationError, "Month failed to update on calender table!" unless @service_booking_5.get_calender_month != @startmonth
end

When /^i check the list of available convieneance options$/ do
  @options = @service_booking_5.get_convieneance_options_list
end

Then /^i should see a list of the following items$/ do |items|
  errors = []
  items.raw.flatten.each do |item|
    errors.push("#{item}") unless @options.include? item
  end

  raise ValidationError, "Could not find Options: #{errors.inspect} in list of convieneance items!" unless errors.length == 0
end

When /^i attempt to continue without setting a date or time for my service$/ do
  @service_booking_5.click_step_6_button
end

Then /^i should see an error message displayed in my browser$/ do
  pending("VWBS-676 -- No error when continueing")
end

When /^i change the collection address setting to not use my default address$/ do
  @service_booking_5.set_manual_collection_address
end

Then /^i should see a set of fields to enter a new collection address$/ do
  @service_booking_5.manual_collection_form_present?
end

When /^i change the delivery address setting to not use my default address$/ do
  @service_booking_5.set_manual_delivery_address
end

Then /^i should see a set of fields to enter a new delivery address$/ do
  @service_booking_5.manual_delivery_form_present?
end


Given /^i select a valid date from the calender for my service$/ do
  step "i select the first available date in the table"
end

And /^i select a time and convienece option that suits me$/ do
  @service_booking_5.set_booking_time("8am - 9am")
  @service_booking_5.select_convieneance_option("Not required")
end


When /^i submit my confirmation of these details$/ do
  step "i attempt to continue without setting a date or time for my service"
end

Then /^i should see the final stage of booking a service$/ do
  pending("Step 6 implementation")
end

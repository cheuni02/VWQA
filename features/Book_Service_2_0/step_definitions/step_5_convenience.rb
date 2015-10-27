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
  raise ValidationException, "Unable to select an available date" unless @service_booking_5.date_active?
end

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

Given /^i am selecting which courtesy option i want when booking a service for my car$/ do
  @serviceStep4 = site.book_service.booking_step4
  @serviceStep4.visit
end

When /^i try to continue to the next step without selecting a time for my service$/ do
  @serviceStep4.click_next_step
end

Then /^i should see an error message shown in my browser telling me to select a time$/ do
  errors = @serviceStep4.getFormErrors
  fail AssertionError, 'Error messages displayed in form entry, expected no errors!' unless errors.length > 0
end

When /^i select the option to have a car loaned to me when i book my service$/ do
  @serviceStep4.select_loan_car_option
end

Then /^i should see two further insurance based options appear on my screen$/ do
  fail ElementNotPresentError, 'Could not find loan car (self insured) convience option element!' unless @serviceStep4.loan_car_self_insured_option_present?
  fail ElementNotPresentError, 'Could not find loan car (added insurance) convience option element!' unless @serviceStep4.loan_car_with_insurance_option_present?
end

When /^i select the option to have my car collected and returned to me$/ do
  @serviceStep4.select_collect_return_option
end

Then /^i should see another two options relating to the distance required in order to have my car collected$/ do
  fail ElementNotPresentError, 'Could not find car collection (Up to 20 mins) convience option element!' unless @serviceStep4.up_to_twenty_mins_present?
  fail ElementNotPresentError, 'Could not find car collection (Up to 40 mins) convience option element!' unless @serviceStep4.up_to_fourty_mins_present?
end

When /^i select a time of "(.*)" from the list of options on the page$/ do |serviceTime|
  @serviceStep4.select_arrival_time(serviceTime)
end

And /^i proceed to the next step of completing my service booking$/ do
  step 'i try to continue to the next step without selecting a time for my service'
end

Then /^i should see a form requiring me to enter my personal details$/ do
  fail PageNotLoadedError, 'Step 5 of book a service was not loaded!' unless site.book_service.booking_step5.page_loaded?
end

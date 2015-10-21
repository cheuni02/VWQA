Given /^i have completed book a service steps 1-3$/ do
  @service_booking = site.service_booking.step1
  @service_booking_2 = site.service_booking.step2
  @service_booking_3 = site.service_booking.step3
  @service_booking.do_step_1
  @service_booking_2.do_step_2
  @service_booking_3.do_step3
end

When /^i am on Step 4$/ do
  @service_booking_4 = site.service_booking.step4
  @service_booking_4.page_loaded?
end

Then /^i should be able to see the (.*) heading in the service panel$/ do |work|
  @service_booking_4.work_sections_present?(work)
end

When /^i am on step 4 i should be able to see what work can have done on my car$/ do

end

Then /^i should be able to select items i want to be done$/ do

end

Given /^i am on Step 4 select work$/ do

end

When /^i view the service panel then the following section (.*) should appear$/ do |section|

end

Then /^i should see activities i can select below$/ do

end

And /^i should be able to select an activity$/ do

end

Given /^i am on the Select work page$/ do

end

When /^i have selected a few work activities for my car$/ do

end

Then /^i should be able to enter some information on what i would liked to be checked$/ do

end

When /^i do not select any options on the Step 4 page$/ do

end

Then /^i should get an error message asking me to select an option or call them$/ do

end

Given /^i have completed book a service steps 1-3$/ do
  @service_booking = site.service_booking.step1
  @service_booking_2 = site.service_booking.step2
  @service_booking_3 = site.service_booking.step3
  @service_booking.do_step_1
  @service_booking_2.do_step_2
  @service_booking_3.do_step3
  @service_booking_4 = site.service_booking.step4
end

When /^i am on Step 4$/ do
  site.my_vw.login.visit
  site.my_vw.login.login(@account[0],@account[1])
  @service_booking.visit
  @service_booking.page_loaded?
  @service_booking.click_step_2_button
  @service_booking_2.page_loaded?
  @service_booking_2.click_step3_button
  @service_booking_3.page_loaded?
  @service_booking_3.click_step4_button
  @service_booking_4.page_loaded?
end

Then /^i should be able to see the service panel$/ do
  @service_booking_4.service_panel_present?
end

And /^the Service and MOT sections$/ do
  raise AssertionError, "MOT and Service section not present" unless @service_booking_4.service_and_mot_section_present?
end

When /^i am on step 4 and am not logged in$/ do
  @service_booking_4.page_loaded?
end

Then /^i should be able to see all the options i have available for my Car$/ do
  step 'i should be able to see the service panel'
  step 'the Service and MOT sections'
end

Given /^i am on Step 4 select work$/ do
  @service_booking_4.page_loaded?
end

When /^i view the service panel then the following section (.*) should appear$/ do |section|
  @service_booking_4.work_sections_present?(section)
end

Then /^i should see activities i can select below the (.*) section$/ do |section|
  @service_booking_4.work_section_activities_present?(section)
end

Given /^i am on the Select work page$/ do
  step 'i am on Step 4 select work'
end

When /^i have selected a few work activities for my car$/ do
  @service_booking_4.select_service_option && @service_booking_4.select_mot_option
end

Then /^i should be able to enter some information on what i would like to be checked$/ do
  raise AssertionError, "Cannot enter information in other checks box" unless @service_booking_4.enter_info_other_checks_box
end

When /^i do not select any options on the Step 4 page$/ do
  pending
end

Then /^i should get an error message asking me to select an option or call them$/ do
  pending
end

When /^i view the recommended work section$/ do
  pending
end

Then /^i should be able to select Recommended work options for my car$/ do
  pending
end

And /^i should see the work option appear in the work summary$/ do
  pending
end

When /^i view the unplanned maintenance section$/ do
  pending
end

Then /^i should be able to select unplanned maintenance options for my car$/ do
  pending
end

And /^i should see the unplanned options appear in the work summary$/ do
  pending
end

When /^i view the service and MOT section$/ do
  pending
end

Then /^i should be able to click on a service and MOT$/ do
  pending
end

And /^it should appear in the work option summary box$/ do
  pending
end

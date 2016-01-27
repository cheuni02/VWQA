Given /^i have completed book a service steps 1-3$/ do
  @service_booking = site.service_booking
  @service_booking.step1.do_step_1
  @service_booking.step2.do_step_2
  @service_booking.step3.do_step_3
  @service_booking_4 = @service_booking.step4
  @service_booking_4.page_loaded?
end

When /^i am on Step 4$/ do
  site.my_vw.login.visit
  site.my_vw.login.login(@account[:username],@account[:password])
  @service_booking.step1.visit
  #@service_booking.page_loaded?
  @service_booking.step1.click_step_2_button
  #@service_booking_2.page_loaded?
  @service_booking.step2.do_step_2    #Reset Data to avoid problems with phone number
  @service_booking.step2.click_step3_button
  #@service_booking_3.page_loaded?
  @service_booking.step3.click_step4_button
  #@service_booking_4.page_loaded?
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
  @service_booking_4.select_service_option
  @service_booking_4.select_mot_option
end

Then /^i should be able to enter some information on what i would like to be checked$/ do
  raise AssertionError, "Cannot enter information in other checks box" unless @service_booking_4.enter_info_other_checks_box
end

And /^i should see my work options appear in the information box$/ do
  pending
end

When /^i do not select any options on the Step 4 page$/ do
  @service_booking_4.click_step5_button
end

Then /^i should get an error message asking me to select an option or call them$/ do
  @service_booking_4.service_work_errors_present?
end

Given /^i edit the details of my service work$/ do
  @service_booking_4.edit_service_work
end

When /^i select some recommended work options from the list in my browser$/ do
  @service_booking_4.select_recommended_work_item
end

Then /^i should see the price for my service change to reflect my choice$/ do
  raise ValidationError, "Price was not updated to new value" unless @service_booking_4.get_total_price > 0.00
end

#And /^i should see the work option appear in the work summary$/ do#
#  pending
#end

When /^i view the unplanned maintenance section$/ do
  step "i edit the details of my service work"
  sleep(2)
  @service_booking_4.enable_unplanned_maintenance
end

Then /^i should be able to select unplanned maintenance options for my car$/ do
  @service_booking_4.select_unplanned_maintenance_item
end

And /^i should see the unplanned options appear in the work summary$/ do
  step "i should see the price for my service change to reflect my choice"
end

#When /^i view the service and MOT section$/ do
#  pending
#end
#
#Then /^i should be able to click on a service and MOT$/ do
#  pending
#end
#
#And /^it should appear in the work option summary box$/ do
#  pending
#end

Given /^i navigate to the book a service page$/ do
  @service_booking = site.service_booking.step1
  @service_booking.visit
end

And /^i expand the Information Panels$/ do
  @service_booking.expand_detail_panels
end


Given /^i am on the Volkswagen Homepage$/ do
  site.homepage.visit
end

When /^i click the book a service button in the navigation$/ do
  site.primary_nav.book_service
end

Then /^i should see step 1 of the new book a service flow loads in my browser$/ do
  @service_booking.page_loaded?
end

Given /^i login to my Volkswagen Account with a valid car saved$/ do
  pending("Required Account Details for these tests")
end

When /^i visit the book a service section of the site$/ do
  pending("Required Account Details for these tests")
end

Then /^i should see the details of my car are present on the page$/ do
  pending("Required Account Details for these tests")
end

When /^i fill in the approximate (.*) value in the more details form$/ do |mileage|
  @service_booking.set_mileage_field(mileage)
end

And /^i attempt to proceed to continue with my service booking$/ do
  @service_booking.click_step_2_button
end

Then /^i should get a (.*) message if it is not valid$/ do |error_message|
  pending("Error Message Not Implemented")
end


When /^i set my expanded details to state i am interested in a service plan$/ do
  @service_booking.set_interested_in_plan
end

And /^i proceed to the next step of service booking$/ do
  step "i attempt to proceed to continue with my service booking"
end

Then /^i should see the following simple text message in my summary$/ do |text|
  service_booking_step_2 = site.service_booking.step2
  service_booking_step_2.page_loaded?
  service_text = service_booking_step_2.get_service_plan_info
  raise AssertionError, "Could not locate matching text in panel on Book a Service Step 2" unless service_text =~ /#{text}/i
end

When /^i set my expanded details to state that i have an extended warrenty$/ do
  @service_booking.set_extended_warrenty
end

And /^i continue to the next step of my service booking$/ do
  step "i attempt to proceed to continue with my service booking"
end

Then /^i should see the summary panel on the next step state that i have extended warrenty$/ do
  pending("Currently just showing true/false... needs proper value and text")
end

When /^i set my expanded details as i already have a service plan$/ do
  @service_booking.set_already_have_plan
  sleep(5)
end

Then /^i should no longer see the option to set that i want a service plan$/ do
  raise ValidationError, "Interested in Service Plan Panel still present!" if @service_booking.interested_in_plan_present?
end

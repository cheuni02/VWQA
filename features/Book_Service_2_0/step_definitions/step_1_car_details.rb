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

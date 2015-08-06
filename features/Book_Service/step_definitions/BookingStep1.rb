Given /^i navigate to the VW Homepage on the website$/ do
  site.homepage.visit
end

When /^i click on the button to book a service$/ do
  site.primary_nav.book_service
end

Then /^i should see the first page of the booking form shown in my browser$/ do
  raise PageNotLoadedError, "Step 1 of book a service page was not loaded!" unless site.book_service.booking_step1.page_loaded?
end

Given /^i go back to the service booking homepage and enter my location as "(.*)"$/ do |location|
  @serviceBooking = site.book_service.booking_step1
  @serviceBooking.visit
  @serviceBooking.set_location(location)
end

When /^i submit my location to the form on the webpage$/ do
  @serviceBooking.location_search
end

Then /^i should see a list of different service dealers nearby displayed in my browser$/ do
  raise ElementNotPresentError, "Could not find results list of service dealers" unless @serviceBooking.search_results_present?
end

And /^i should see information about one of the service dealers such as opening times$/ do
  raise ElementNotPresentError, "Coule not find retailer information in service dealers results" unless @serviceBooking.retailer_info_present?
end

Given /^i enter another search location of "(.*)"$/ do |location|
  step "i go back to the service booking homepage and enter my location as \"#{location}\""
end

When /^i search for this location on the book a service page$/ do
  step "i submit my location to the form on the webpage"
end

And /^i decide to view a map of all nearby car servicing retailers$/ do
  @serviceBooking.set_map_view
end

Then /^i should see a map presented on the page containing all my nearby service dealers$/ do
  @serviceBooking.map_details_present?
end

Given /^i enter my location as "(.*)"$/ do |location|
  step "i go back to the service booking homepage and enter my location as \"#{location}\""
end

When /^i submit my location information to the service dealer pages$/ do
  step "i submit my location to the form on the webpage"
end

And /^i continue to the next step of booking my service request$/ do
  @serviceBooking.click_next_step
end

Then /^i should see a field that will allow me to enter the registration details of my car$/ do
  raise PageNotLoadedError, "Step 2 of book a service page was not loaded" unless site.book_service.booking_step2.page_loaded?
end

When /^i enter and submit (.*) as my location in the text field$/ do |location|
  step "i go back to the service booking homepage and enter my location as \"#{location}\""
  @serviceBooking.location_search
end

Then /^an error (.*) be presented on the page in my browser$/ do |errorState|
  errors = @serviceBooking.getFormErrors
  raise AssertionError, "Expected No form errors, yet errors were found!" if (errorState =~ /not/i && errors.length > 0)
  raise AssertionError, "Expected form errors, yet no errors were found!" if (errorState !~ /not/i && errors.length == 0)
end

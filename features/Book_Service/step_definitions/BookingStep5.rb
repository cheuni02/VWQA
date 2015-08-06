Given /^i am entering my personal details for finalizing my service booking$/ do
  @serviceStep5 = site.book_service.booking_step5
  @serviceStep5.visit
  @serviceStep5.click_go_back
  @serviceStep5.click_next_step
end

When /^i search for my valid address using the postcode "(.*)"$/ do |postcode|
  @serviceStep5.set_postcode(postcode)
  @serviceStep5.postcode_search
end

Then /^i should see my town information appear as "(.*)"$/ do |town|
  sleep(3)
  #STDOUT.puts(@serviceStep5.get_town_info)
  raise AssertionError, "Town information not displayed after postcode search, expected: #{town}, got: #{@serviceStep5.get_town_info}" unless @serviceStep5.get_town_info =~ /#{town}/i
end

When /^i search for my invalid address using the postcode "(.*)"$/ do |postcode|
  step "i search for my valid address using the postcode \"#{postcode}\""
end

Then /^no details should be entered into the other address fields on the page$/ do
  raise AssertionError, "Invalid data entered to town field with incorrect postcode! Got: #{@serviceStep5.get_town_info}" unless @serviceStep5.get_town_info.length == 0
end

Given /^i change my convenience option to have my car picked up and collected$/ do
  @serviceStep5.click_go_back
  site.book_service.booking_step4.select_collect_return_option
  @serviceStep5.click_next_step
end

When /^i need to use my main address to have my car collected from$/ do
  @serviceStep5.select_collect_from_home
end

And /^i also need to use my main address to have my car dropped off at$/ do
  @serviceStep5.select_deliver_to_home
end

Then /^i should find that the address fields in these sections are disabled$/ do
  raise InvalidElementStateError, "Collect from location address fields were not disabled!" unless @serviceStep5.collect_postcode_disabled?
  raise InvalidElementStateError, "Deliver to location address fields were not disabled!" unless @serviceStep5.deliver_postcode_disabled?
end

When /^i enter my personal details as (.*) (.*) (.*)$/ do |title, first_name, surname|
  @serviceStep5.set_title(title)
  @serviceStep5.set_first_name(first_name)
  @serviceStep5.set_surname(surname)
end

And /^i enter my contact information including telephone number of (.*) and email address (.*)$/ do |telephone, email|
  @serviceStep5.set_telephone(telephone)
  @serviceStep5.set_email(email)
end

And /^i enter my address as "(.*)" and use this address for picking up and collecting my car$/ do |postcode|
  step "i search for my valid address using the postcode \"#{postcode}\""
  @serviceStep5.set_house_number("999999")
end

And /^i randomly set my communication preferences using the checkboxes provided$/ do
  checkboxes = rand(6)
  @serviceStep5.click_email_preference if checkboxes < 1
  @serviceStep5.click_sms_preference if checkboxes < 2
  @serviceStep5.click_telephone_preference if checkboxes < 3
  @serviceStep5.click_post_preference if checkboxes < 4
  @serviceStep5.click_comm_preference if checkboxes < 5
end

Then /^i (.*) find that i am able to continue to the next step of booking my car service$/ do |expected|
  @serviceStep5.click_next_step
  raise AssertionError, "Expected Step 5 of book a service page to be loaded, confirmation page was found!" if (expected !~ /not/i && @serviceStep5.page_loaded?)
  raise AssertionError, "Expected Service Confirmation page to be loaded, Step 5 page was found!" if (expected =~ /not/i && @serviceStep5.confirmation_page_loaded?)
end

When /^i enter my personal details to the required fields$/ do
  step "i enter my personal details as Lord Test Test"
  step "i enter my contact information including telephone number of 02079460777 and email address test@example.com"
  step "i enter my address as \"UB6 7HA\" and use this address for picking up and collecting my car"
  step "i randomly set my communication preferences using the checkboxes provided"
end

And /^i click the button to confirm my details$/ do
  @serviceStep5.click_next_step
end

Then /^i should be taken to the confirm my details page$/ do
  raise PageNotLoadedError, "Book a service confirmation page not loaded" unless @serviceStep5.confirmation_page_loaded?
end

And /^if i confirm my details using the review and confirm button$/ do
  @serviceStep5.click_next_step
end

Then /^i should see the booking confirmation screen appear in my browser$/ do
  raise PageNotLoadedError, "Book a service final confirmation page not loaded" unless @serviceStep5.final_confirmation_present?
end

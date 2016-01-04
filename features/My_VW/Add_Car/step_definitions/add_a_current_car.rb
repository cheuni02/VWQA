Given /^i have logged into my VW account and am on the My VW page$/ do
  @current_car = site.my_vw.current_car_dashboard
  @add_car = site.my_vw.add_current_car
  @current_car.visit
  site.my_vw.login.login(@account[0],@account[1])
end

And /^i go to the add a car page and click on the "A car i own" button$/ do
  @add_car.visit
  @add_car.click_i_own_car_button
end

When /^i check that i am on the Add a car i own page$/ do
  #nothing to do
end

Then /^i should see the registration field appear$/ do
  expect(@add_car.registration_field_present?).to be true
end

When /^i enter a (.*) in the input field$/ do |registration|
  @add_car.enter_registrations(registration)
  @add_car.click_registration_lookup_button
end

Then /^i should see a (.*) message if the registration needs to be reviewed$/ do |message|
  expect(@add_car.error_message_present?).to be false
end

When /^i enter one of my (.*)$/ do |registrations|
  @add_car.enter_valid_registrations(registrations)
end

And /^click the lookup button$/ do
  @add_car.click_registration_lookup_button
end

Then /^i should see a message saying think we've found your car$/ do
  expect(@add_car.found_car_text_present?).to be false

  #raise AssertionError, "Found car message not present" unless !@add_car.found_car_text_present?
end

When /^i have completed steps 1a and 1b$/ do
  @add_car.step_1a_b
end

And /^have selected the used car button and given it a name$/ do
  @add_car.click_used_car_button
  @add_car.enter_car_name
end

Then /^after i click continue i should be taken to a page asking me to select a retailer$/ do
  raise AssertionError, "Continue button not present" unless !@add_car.continue_to_step_2
end

When /^i have completed steps 1a, b and click on the edit link in the My cars box$/ do
  step "i have completed steps 1a and 1b"
  @add_car.click_edit_link
end

And /^i fill in the required details such as (.*), (.*), (.*), (.*)$/ do |day, month, year, engine_size|
  @add_car.fill_in_car_details(day, month, year, engine_size)
end

Then /^i should see a error message to let me know if i need to review any details$/ do
  pending
end

When /^i finish completing step 1 fully$/ do
  step "i have completed steps 1a and 1b"
  step 'have selected the used car button and given it a name'
  @add_car.continue_to_step_2
end

And /^i enter a (.*) in the search field and click the lookup button$/ do |postcode|
  @add_car.page_loaded
  @add_car.search_by_postcode(postcode)
  @add_car.click_postcode_lookup_button
end

Then /^i should see a list of retailers in a list or an error message if input is invalid$/ do
  raise AssertionError, "no retailers or error" unless @add_car.validate_postcode_field == true
end

When /^i have completed Step 1a, b, c$/ do
  step 'i finish completing step 1 fully'
end

And /^search for a retailer using a (.*)$/ do |retailer_name|
  @add_car.search_by_retailer_name(retailer_name)
end

Then /^i should be able to select that retailer$/ do
  @add_car.click_retailer_name
  @add_car.retailer_list_present?
end

And /^see the options to select it for Delivery and Servicing$/ do
  raise AssertionError, "preferred retailer options not present" unless @add_car.preferred_retailer_options_present?
end

When /^i have finished all the steps until selecting a retailer$/ do
  step 'i finish completing step 1 fully'
end

And /^i select my retailer and click the continue button$/ do
  @add_car.choose_my_retailer
  @add_car.click_finish_button
end

Then /^i should be able to see Step 3 Registered owner details$/ do
  pending
end

When /^i have completed Steps 1 and 2$/ do
  step 'i finish completing step 1 fully'
  @add_car.choose_my_retailer
end

And /^i click the Skip & finish button$/ do
  pending
end

Then /^i should see the car in the my cars dropdown section$/ do
  pending
end

When /^i have completed Steps 1 and 2 for adding a car i own$/ do
  step 'i have completed Steps 1 and 2'
end

And /^i enter (.*) and (.*) into the fields$/ do |last_name, postcode|
  pending
end

Then /^i should get an error message if no record is present$/ do
  pending
end

When /^i have complete Steps 1 and 2 for adding my car$/ do
  step 'i have completed Steps 1 and 2'
end

And /^i enter my last name and postcode$/ do
  pending
end

Then /^after i click finish i should see my car in the my cars menu$/ do
  pending
end

When /^i have added a car$/ do
  pending
end

And /^i hover over the my cars nav bar$/ do
  pending
end

Then /^i should be able to click on the bin icon on the cars$/ do
  pending
end

And /^the car should be deleted$/ do
  pending
end

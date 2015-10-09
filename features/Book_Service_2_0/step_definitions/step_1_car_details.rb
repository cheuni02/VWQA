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
  sleep(2) # Needs to have a brief pause here to allow the element to change state to hidden
end

Then /^i should no longer see the option to set that i want a service plan$/ do
  raise ValidationError, "Interested in Service Plan Panel still present!" if @service_booking.interested_in_plan_present?
end

When /^i enable the I lease this car radio button in the more info box$/ do
  @service_booking.set_leased_car
end

Then /^i should be able to type the lease (.*) in the field$/ do |car_lease|
  @service_booking.set_leased_car_field(car_lease)
end

And /^an error message (.*) be displayed if it is not valid and i try to proceed$/ do |message|
  pending("Error Messages not implemented")
end

Given /^my car has been leased to me by another company$/ do
  step "i enable the I lease this car radio button in the more info box"
end

When /^i enter the name of the company into the leased car field$/ do
  step "i should be able to type the lease CostCarCo in the field"
end

And /^i proceed to the next page of service booking$/ do
  step "i attempt to proceed to continue with my service booking"
end

Then /^i should see my leased car details contained in my current booking summary$/ do
  #service_booking_step_2 = site.service_booking.step2
  #service_booking_step_2.page_loaded?
  #service_text = service_booking_step_2.get_service_plan_info
  pending("Display of leased car in second page info not implemented")
end

Given /^i log into an account with multiple cars saved$/ do
  pending("Account with correct setup not available for these tests")
end

When /^i return to the service booking page$/ do
  step "i click the book a service button in the navigation"
end

And /^i expand the car details panel$/ do
  step "i expand the Information Panels"
end

Then /^i should see a dropdown allowing me to select which car i want to book for a service$/ do
  # Pending - Enter code here
end

And /^if i change the dropdown the values in the car details panel should change$/ do
  # Pending - Enter code here
end

Given /^i click on the "Registration Lookup" Button$/ do
  @service_booking.click_registration_lookup
end

When /^i enter a vehicle registration (.*) into the registration field$/ do |registration|
  @service_booking.set_registration_field(registration)
end

And /^i click on the lookup button to find my registration$/ do
  @service_booking.do_registration_lookup
  @service_booking.click_select_car # This is a temp hack to get it to work! Please remove later
end

Then /^i should see my car details get filled in automatically with data$/ do
  raise AssertionError, "Car Details were not filled in with valid registration!" unless @service_booking.get_derivative_name.length > 0
end

Given /^i am attempting to look up my car registration$/ do
  step "i click on the \"Registration Lookup\" Button"
end

When /^i enter an invalid registration number "(.*)"$/ do |registration|
  step "i enter a vehicle registration #{registration} into the registration field"
end

And /^i click on the lookup button to find this registration$/ do
  step "i click on the lookup button to find my registration"
end

Then /^i should not see any data in the car details fields$/ do
  raise AssertionError, "Car Details were entered with invalid registration number!" unless @service_booking.get_derivative_name.length == 0
end

When /^i complete the Car information by entering my <model> and <trim>$/ do |model,trim|
  pending("Model Field currently AWOL")
end

And /^i also enter my engine size of <engine_size> with manufacture year <year>$/ do  |engine_size,year|
  # Pending - Enter code here later
end

And /^i set the transmission to <transmission> with fuel type <fuel>$/ do |transmission,fuel|
  # Pending - Enter code here later
end

And /^i attempt to proceed with the next step of booking a service$/ do
  step "i attempt to proceed to continue with my service booking"
end

Then /^i <proceed> be able to continue with booking a service$/ do |proceed|
  # Pending - Enter code here later
end

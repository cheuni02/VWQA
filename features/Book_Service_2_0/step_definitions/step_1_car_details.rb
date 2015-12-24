Given /^I am on the Volkswagen Homepage$/ do
  site.homepage.visit
end

When /^I login into my account$/ do
  account = site.my_vw.login.get_login_details('Current_car_User')
  site.my_vw.login.login_link.when_present.click
  site.my_vw.login.login(account[0], account[1])
end

When /^I click the book a service button in the navigation$/ do
  site.primary_nav.book_service
end

Then /^I should see step 1 of book a service$/ do
  site.service_booking.step1.page_loaded?
end

And /^I can not continue until I enter a vehicle registration$/ do
  expect(site.service_booking.step1.registration_lookup.enabled?).to eq(false)
  expect(site.service_booking.step1.step2_button.enabled?).to eq(false)
end

When /^I fill in the approximate(?: mileage with | )(.*) under more info$/ do |mileage|
  site.service_booking.step1.mileage_field.when_present.set(mileage)
end

When /^I enter a vehicle (?:invalid|valid) (.*)$/ do |registration|
  site.service_booking.step1.registration_field.when_present.set(registration)
end

Given /^I clear the vehicle Registration field$/ do
  site.service_booking.step1.registration_field.when_present.clear
end

And /^I click lookup button to find my registration$/ do
  service_booking = site.service_booking.step1
  service_booking.registration_lookup.when_present.click
  Watir::Wait.while { service_booking.loading_wheel.visible? }
end

Then /^I will see my car (.*), (.*), (.*), (.*), (.*), (.*) populated$/ do |model, trim, engine, year, trans, fuel|
  steps %Q{
And I will see my car details form populated with:
| Model | Trim | Engine size | Year of manufacture | Transmission | Fuel type |
| #{model} | #{trim} | #{engine} | #{year} | #{trans} | #{fuel} |
   }
end

Then /^I will see my car details form populated with:$/ do |table|
  service_booking = site.service_booking.step1
  table.hashes.each do |hash|
    expect(service_booking.model_field.when_present.value).to eq(hash['Model'])
    expect(service_booking.trim_field.when_present.value).to eq(hash['Trim'])
    expect(service_booking.engine_size_field.when_present.value).to eq(hash['Engine size'])
    expect(service_booking.year_made_field.when_present.value).to eq(hash['Year of manufacture'])

    if hash['Transmission'] =~ /Manual/
      expect(service_booking.manual_transmission_radio.set?).to eq(true)
      expect(service_booking.auto_transmission_radio.set?).to eq(false)
    else
      expect(service_booking.manual_transmission_radio.set?).to eq(false)
      expect(service_booking.auto_transmission_radio.set?).to eq(true)
    end

    if hash['Fuel type'] =~ /Petrol/
      expect(service_booking.fuel_petrol_radio.set?).to eq(true)
      expect(service_booking.fuel_diesel_radio.set?).to eq(false)
    else
      expect(service_booking.fuel_petrol_radio.set?).to eq(false)
      expect(service_booking.fuel_diesel_radio.set?).to eq(true)
    end
  end
end

Then /^I will see car details are incomplete with (.*)/ do |feedback|
  steps %Q{
Then I will see feedback that my car details are incorrect with:
                                                |   Feedback   |
                                                | #{feedback}  |
}
end

Then /^I will see feedback that my car details are (?:incomplete|incorrect) with:$/ do |table|
  service_booking = site.service_booking.step1
  expect(service_booking.registration_error_box.exists?).to eq(true)
  table.hashes.each_with_index do |hash, index|
    expect(service_booking.registration_error_box.li(index: index).text).to eq(hash['Feedback'])
  end
end

Then /^I will see more info details in summary as:$/ do |table|
  service_booking2 = site.service_booking.step2
  table.hashes.each do |hash|
    expect(service_booking2.service_plan_summary).to eq(hash['Service Plan'])
    expect(service_booking2.extended_warranty_summary).to eq(hash['Extended warranty'])
    expect(service_booking2.leased_with_summary).to eq(hash['Leased with'])
  end
end

Then /^I will see a form to (?:enter|update) my car details$/ do
  expect(site.service_booking.step1.edit_car_details_form.present?).to eq(true)
end

When /^I select that I have a service plan$/ do
  site.service_booking.step1.service_plan_label.click
end

When /^I select that I'm interested in a service plan$/ do
  site.service_booking.step1.interested_in_plan_label.click
end

When /^I select that I have a extended warranty$/ do
  site.service_booking.step1.warranty_label.click
end

When /^I select that I lease my car$/ do
  site.service_booking.step1.leased_car_label.click
end

Then /^I will see feedback for more info (.*)$/ do |feedback|
  @service_booking = site.service_booking.step1
  expect(@service_booking.registration_error_more_info.exists?).to eq(true)
  expect(@service_booking.registration_error_more_info.text).to eq(feedback)
end

When /^I provide a lease company (.*)$/ do |lease_company|
  site.service_booking.step1.leased_car_field.set(lease_company)
end

Then /^the option for I'm interested in a service plan will disappear$/ do
  expect(site.service_booking.step1.interested_in_plan_label.present?).to eq(false)
end

Then /^I (?:update|add) the (.*) field with (.*)$/ do |car_detail_field, value|
  service_booking = site.service_booking.step1
  case car_detail_field
    when 'Model'
      service_booking.model_field.when_present.set(value)
    when 'Trim'
      service_booking.trim_field.when_present.set(value)
    when 'Engine size'
      service_booking.engine_size_field.when_present.set(value)
    when 'Year of manufacture'
      service_booking.year_made_field.when_present.set(value)
  end
end

Then /^I set the transmission to (.*)$/ do |trans_type|
  service_booking = site.service_booking.step1
  if trans_type =~ /Manual/
    service_booking.set_manual_transmission.click
  elsif trans_type =~ /Automatic/
    service_booking.set_auto_transmission.click
  end
end

Then /^I set the fuel type to (.*)$/ do |fuel_type|
  service_booking = site.service_booking.step1
  if fuel_type =~ /Petrol/
    service_booking.set_fuel_petrol.click
  elsif fuel_type =~ /Diesel/
    service_booking.set_fuel_diesel.click
  end
end

When /^I select Next - My details$/ do
  service_booking = site.service_booking.step1
  service_booking.step2_button.when_present.click
  Watir::Wait.while { service_booking.loading_wheel.visible? }
end

Then /^I will see my car details summary populated with:$/ do |table|
  service_booking2 = site.service_booking.step2
  table.hashes.each do |hash|
    expect(service_booking2.car_trim_details).to eq(hash['Trim'])
    expect(service_booking2.car_year_made_details).to eq(hash['Year of manufacture'])
    expect(service_booking2.car_reg_details).to eq(hash['Registration'])
    expect(service_booking2.engine_size_details).to eq(hash['Engine size'])
    expect(service_booking2.fuel_type_details).to eq(hash['Fuel type'])
    expect(service_booking2.transmission_details).to eq(hash['Transmission'])
  end
end

Then /^I will see my car details summary on step 1 with:$/ do |table|
  service_booking = site.service_booking.step1
  table.hashes.each do |hash|
    expect(service_booking.car_trim_details).to eq(hash['Trim'])
    expect(service_booking.car_year_made_details).to eq(hash['Year of manufacture'])
    expect(service_booking.car_reg_details).to eq(hash['Registration'])
    expect(service_booking.engine_size_details).to eq(hash['Engine size'])
    expect(service_booking.fuel_type_details).to eq(hash['Fuel type'])
    expect(service_booking.transmission_details).to eq(hash['Transmission'])
  end
end


Then(/^my car details are editable$/) do
  site.service_booking.step1.edit_user_car_details.when_present.click
end


When /^I select change my car details$/ do
  site.service_booking.step2.update_car_details.click
end

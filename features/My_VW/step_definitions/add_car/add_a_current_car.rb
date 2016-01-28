Then(/^I will be on add a car section with options:$/) do |table|
  expect(site.my_vw.add_current_car.add_a_car_choices.present?).to be(true)
  options = []
  table.hashes.each do |option|
    options << site.my_vw.add_current_car.add_a_car_options(option["I'd like to add"])
  end
  expect(options.flatten.count).to eq(0), "The following option #{options.flatten} is not present"
end

Then(/^none will be set$/) do
  add_car = site.my_vw.add_current_car
  expect(add_car.car_i_own_radio.set?).to be(false)
  expect(add_car.car_i_ordered_radio.set?).to be(false)
  expect(add_car.car_i_configured_radio.set?).to be(false)
end

When(/^I select the (A car I own|A car I ordered|A configured car) button$/) do |button|
  add_car = site.my_vw.add_current_car
  if button =~ /A car I own/
    add_car.car_i_own_button.when_present.click
  elsif button =~ /A car I ordered/
    add_car.car_i_ordered_button.when_present.click
  elsif button =~ /A configured car/
    add_car.car_configured_button.when_present.click
  end
end

Then(/^I will see a pop up informing me (.*)$/) do |feedback|
  add_car = site.my_vw.add_current_car
  expect(add_car.max_car_limit.present?).to be true
  expect(add_car.max_car_limit.h2.text).to eq(feedback)
end

When(/^I select ok$/) do
  site.my_vw.add_current_car.max_car_limit_button.click
end

Then(/^I will see a registration field$/) do
  expect(site.my_vw.add_current_car.registration_text_field.present?).to be true
end

Then(/^the Lookup button is (disabled|enabled)$/) do |button|
  if button =~ /disabled/
    expect(site.my_vw.add_current_car.reg_lookup_button.enabled?).to be false
  else
    expect(site.my_vw.add_current_car.reg_lookup_button.enabled?).to be true
  end
end

When(/^I lookup the registration$/) do
  site.my_vw.add_current_car.reg_lookup_button.when_present.click
end

Then(/^I will see error message:$/) do |table|
  add_car_error_message = site.my_vw.add_current_car.error_message
  table.hashes.each do |hash|
    Timeout.timeout(3) { sleep 0.5 unless add_car_error_message.text == hash['Feedback'] }
    expect(add_car_error_message.text).to eq(hash['Feedback'])
  end
end

Then(/^I will see my car details in summary:$/) do |table|
  add_car = site.my_vw.add_current_car
  Timeout.timeout(3) { sleep 1 unless add_car.success_message.visible? }
  expect(add_car.success_message.visible?).to be true
  table.hashes.each do |hash|
    expect(add_car.searched_car_reg.text).to eq(hash['Registration number'])
    expect(add_car.searched_car_model.text).to eq(hash['Model'])
    expect(add_car.searched_car_detail.text).to eq(hash['Details'])
  end
end

Then(/^I will see my car details in editable form:$/) do |table|
  add_car = site.my_vw.add_current_car
  Timeout.timeout(3) { sleep 0.5 unless add_car.edit_car_form.present? }
  Timeout.timeout(3) { sleep 0.5 unless add_car.details_registration_number.text == @reg_num }
  table.hashes.each do |hash|
    expect(add_car.model_field.value).to eq(hash['Model'])
    expect(add_car.derivative_field.value).to eq(hash['Derivative'])
    expect(add_car.engine_size_field.value).to eq(hash['Engine size'])
    expect(add_car.year_manufacture.value).to eq(hash['Year of Manufacture'])

    fuel_type = hash['Fuel type']
    if fuel_type =~ /Petrol/
      expect(add_car.fuel_type_petrol_radio.set?).to be(true)
    elsif fuel_type =~ /Diesel/
      expect(add_car.fuel_type_diesel_radio.set?).to be(true)
    elsif fuel_type =~ /Hybrid/
      expect(add_car.fuel_type_hybrid_radio.set?).to be(true)
    elsif fuel_type =~ /Electric/
      expect(add_car.fuel_type_electric_radio.set?).to be(true)
    end

    if hash['Transmission'] =~ /Manual/
      expect(add_car.transmission_manual_radio.set?).to be(true)
    else
      expect(add_car.transmission_automatic_radio.set?).to be(true)
    end
  end
end

Then(/^acquired as will be set to (A new car|A used car)$/) do |car_age|
  add_car = site.my_vw.add_current_car
  if car_age =~ /A new car/
    expect(add_car.car_age_new.set?).to be(true)
  else
    expect(add_car.car_age_used.set?).to be(true)
  end
end

Then(/^my car will be called (.*) by default$/) do |nickname|
  expect(site.my_vw.add_current_car.my_car_name_input_box.value).to eq(nickname)
end

When(/^I select edit my car details$/) do
  site.my_vw.add_current_car.edit_my_car_details.click
end

Given (/^I select change step 1 details$/) do
  site.my_vw.add_current_car.change_section_1.when_present.click
end

And(/^I select continue$/) do
  site.my_vw.add_current_car.goto_section2.when_present.click
end

Then(/^I will see that my car details are incomplete with (.*)$/) do |feedback|
  steps %(
      Then I will see that my car details are incomplete with:
      | Feedback    |
      | #{feedback} |
        )
end

Then (/^I will see that my car details are (?:incomplete|incorrect) with:$/) do |table|
  add_car = site.my_vw.add_current_car
  Timeout.timeout(3) { sleep 0.5 unless add_car.my_car_details_errors.visible? }
  expect(add_car.my_car_details_errors.visible?).to eq(true)
  table.hashes.each_with_index do |hash, index|
    Timeout.timeout(3) { sleep 0.5 unless add_car.my_car_details_errors.li(index: index).text == hash['Feedback'] }
    expect(add_car.my_car_details_errors.li(index: index).text).to eq(hash['Feedback'])
  end
end

Then(/^I will see my car name validation feedback (.*)$/) do |feedback|
  add_car = site.my_vw.add_current_car
  Timeout.timeout(3) { sleep 0.5 unless add_car.car_name_validation_message.text == feedback }
  expect(add_car.car_name_validation_message.when_present.text).to eq(feedback)
end

Then(/^I will see form validation feedback (.*)$/) do |feedback|
  expect(site.my_vw.add_current_car.car_name_validation_message.when_present.text).to eq(feedback)
end

When(/^I update (model|derivative|engine size|my car name) to (.*)/) do |field, value|
  add_car = site.my_vw.add_current_car
  if field =~ /model/
    add_car.model_field.when_present.set(value)
  elsif field =~ /derivative/
    add_car.derivative_field.when_present.set(value)
  elsif field =~ /engine size/
    add_car.engine_size_field.when_present.set(value)
  else
    add_car.my_car_name_input_box.when_present.set(value)
  end
end

When(/^I clear (model|derivative|engine size|my car name)$/) do |field|
  add_car = site.my_vw.add_current_car
  if field =~ /model/
    add_car.model_field.when_present.clear
  elsif field =~ /derivative/
    add_car.derivative_field.when_present.clear
  elsif field =~ /engine size/
    add_car.engine_size_field.when_present.clear
  else
    add_car.my_car_name_input_box.when_present.clear
  end
end

When(/^I update year of manufacture to (.*)$/) do |year|
  site.my_vw.add_current_car.year_manufacture_options(year)
end

When(/^I update fuel type to (Petrol|Diesel|Hybrid|Electric)$/) do |fuel_type|
  add_car = site.my_vw.add_current_car
  if fuel_type =~ /Petrol/
    add_car.fuel_type_petrol.click
  elsif fuel_type =~ /Diesel/
    add_car.fuel_type_diesel.click
  elsif fuel_type =~ /Hybrid/
    add_car.fuel_type_hybrid.click
  elsif fuel_type =~ /Electric/
    add_car.fuel_type_electric.click
  end
end

When(/^I update transmission to (Manual|Automatic)$/) do |transmission|
  add_car = site.my_vw.add_current_car
  if transmission =~ /Manual/
    add_car.transmission_manual.click
  elsif transmission =~ /Automatic/
    add_car.transmission_automatic.click
  end
end

When(/^I add (.*) into the registration field$/) do |registration|
  @reg_num = registration
  site.my_vw.add_current_car.registration_text_field.when_present.set(@reg_num)
end

Then(/^I will see a summary of step 1:$/) do |table|
  add_car = site.my_vw.add_current_car
  Timeout.timeout(3) { sleep 1 unless add_car.step_1_summary.visible? }
  expect(add_car.step_1_summary.when_present.present?).to be true
  table.hashes.each do |hash|
    expect(add_car.step_1_summary_reg.text).to eq(hash['Registration number'])
    expect(add_car.step_1_summary_model.text).to eq(hash['Model'])
    expect(add_car.step_1_summary_details.text).to eq(hash['Details'])
  end
end

Then(/^that my car was acquired as: (.*)$/) do |acquired_as|
  expect(site.my_vw.add_current_car.step_1_summary_acquired_as).to eq(acquired_as)
end

Then(/^that I named my car: (.*)$/) do |car_name|
  expect(site.my_vw.add_current_car.step_1_summary_car_name).to eq(car_name)
end

Then(/^my previously chosen retail (.*) is preselected$/) do |retailer|
  add_car = site.my_vw.add_current_car
  expect(add_car.preselected_retailer.h3.text).to eq(retailer)
  expect(add_car.preselected_retailer_radio.set?).to be(true)
end

Given(/^I have successfully completed step 1 with registration (.*)$/) do |reg|
  steps %(
    Given I am on the Volkswagen Homepage
    And I login into my account
    And I go to add a new car
    And I select the A car I own button
    And I add #{reg} into the registration field
    And I lookup the registration
        )
end

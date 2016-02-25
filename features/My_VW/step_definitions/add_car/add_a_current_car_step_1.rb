Then(/^I will be on add a car section with options:$/) do |table|
  expect(site.my_vw.add_current_car.add_a_car_choices.present?).to be(true)
  options = []
  table.hashes.each do |option|
    options << site.my_vw.add_current_car_step_1.add_a_car_options(option["I'd like to add"])
  end
  expect(options.flatten.count).to eq(0), "The following option #{options.flatten} is not present"
end

Then(/^none will be set$/) do
  add_car = site.my_vw.add_current_car_step_1
  expect(add_car.car_i_own_radio.set?).to be(false)
  expect(add_car.car_i_ordered_radio.set?).to be(false)
  expect(add_car.car_i_configured_radio.set?).to be(false)
end

When(/^I select the (A car I own|A car I ordered|A configured car) button$/) do |button|
  add_car = site.my_vw.add_current_car_step_1
  Watir::Wait.until { add_car.car_i_own_button.present? }
  if button == 'A car I own'
    Timeout.timeout(3) { add_car.car_i_own_button.when_present.click until add_car.max_car_limit.present? || add_car.registration_text_field.present? }
  elsif button == 'A car I ordered'
    add_car.car_i_ordered_button.when_present.click
  elsif button == 'A configured car'
    add_car.car_configured_button.when_present.click
  end
end

Then(/^I will see a pop up informing me (.*)$/) do |feedback|
  add_car = site.my_vw.add_current_car_step_1
  Watir::Wait.until(14) { add_car.max_car_limit.present? }
  expect(add_car.max_car_limit.present?).to be true
  expect(add_car.max_car_limit.h2.text).to eq(feedback)
end

When(/^I select ok$/) do
  site.my_vw.add_current_car_step_1.max_car_limit_button.click
end

Then(/^I will see a registration field$/) do
  expect(site.my_vw.add_current_car_step_1.registration_text_field.present?).to be true
end

Then(/^the Lookup button is (disabled|enabled)$/) do |button|
  if button =~ /disabled/
    expect(site.my_vw.add_current_car_step_1.reg_lookup_button.enabled?).to be false
  else
    expect(site.my_vw.add_current_car_step_1.reg_lookup_button.enabled?).to be true
  end
end

When(/^I lookup the registration$/) do
  site.my_vw.add_current_car_step_1.reg_lookup_button.when_present.click
  Watir::Wait.while { site.my_vw.add_current_car.loading_wheel.visible? }
end

Then(/^I will see error message:$/) do |table|
  add_car = site.my_vw.add_current_car_step_1
  table.hashes.each do |hash|
    Watir::Wait.until { add_car.error_message.text.include? hash['Feedback'] }
    expect(add_car.error_message.text).to eq(hash['Feedback'])
  end
end

Then(/^I will see my car details in summary:$/) do |table|
  add_car = site.my_vw.add_current_car_step_1
  Watir::Wait.until { add_car.success_message.visible? }
  expect(add_car.success_message.visible?).to be true
  table.hashes.each do |hash|
    expect(add_car.searched_car_reg.text).to eq(hash['Registration number'])
    expect(add_car.searched_car_model.text).to eq(hash['Model'])
    expect(add_car.searched_car_detail.text).to eq(hash['Details'])
  end
end

Then(/^I will see my car details in editable form with no details:$/) do |table|
  add_car = site.my_vw.add_current_car_step_1
  Watir::Wait.until { add_car.edit_car_form.visible? }
  expect(add_car.edit_car_form.visible?).to be true
  fields = []
  table.hashes.each do |hash|
    fields << add_car.car_form_fields_empty(hash['in the these fields'])
  end
  expect(fields.flatten.count).to eq(0), "Failed due to the following: #{fields.flatten}"
end

Then(/^I will see that none of these:$/) do |table|
  add_car = site.my_vw.add_current_car_step_1
  radios = []
  table.hashes.each do |hash|
    radios << add_car.car_form_options(hash['options are selected'])
  end
  expect(radios.flatten.count).to eq(0), "Failed due to the following: #{radios.flatten}"
end

Then(/^I will see my car details in editable form:$/) do |table|
  add_car = site.my_vw.add_current_car_step_1
  Watir::Wait.until { add_car.edit_car_form.present? }
  table.hashes.each do |hash|
    expect(add_car.model_field.value).to eq(hash['Model'])
    expect(add_car.derivative_field.value).to eq(hash['Derivative'])
    expect(add_car.engine_size_field.value).to eq(hash['Engine size'])
    expect(add_car.year_manufacture.value).to eq(hash['Year of Manufacture'])
    expect(add_car.date_registered_day.value).to eq(hash['Date of registration'].split(%r{/}).collect(&:strip)[0])
    expect(add_car.date_registered_month.value).to eq(hash['Date of registration'].split(%r{/}).collect(&:strip)[1])
    expect(add_car.date_registered_year.value).to eq(hash['Date of registration'].split(%r{/}).collect(&:strip)[2])

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

    transmission = hash['Transmission']
    if transmission =~ /Manual/
      expect(add_car.transmission_manual_radio.set?).to be(true)
    elsif transmission =~ /Automatic/
      expect(add_car.transmission_automatic_radio.set?).to be(true)
    end
  end
end

Then(/^acquired as will be set to (A new car|A used car)$/) do |car_age|
  add_car = site.my_vw.add_current_car_step_1
  if car_age =~ /A new car/
    expect(add_car.car_age_new.set?).to be(true)
  else
    expect(add_car.car_age_used.set?).to be(true)
  end
end

Then(/^my car will be called (.*) by default$/) do |nickname|
  expect(site.my_vw.add_current_car_step_1.my_car_name_field.value).to eq(nickname)
end

When(/^I select edit my car details$/) do
  site.my_vw.add_current_car_step_1.edit_my_car_details.click
  Watir::Wait.while { site.my_vw.add_current_car.loading_wheel.visible? }
end

And(/^I select continue$/) do
  site.my_vw.add_current_car.continue_to_next_step.when_present.click
  Watir::Wait.while { site.my_vw.add_current_car.loading_wheel.visible? }
end

And(/^I select continue to step (\d+)$/) do |step|
  case step
    when '2'
      site.my_vw.add_current_car_step_1.go_to_section_2.when_present.click
    when '3'
      site.my_vw.add_current_car_step_2.go_to_section_3.when_present.click
  end
  Watir::Wait.while { site.my_vw.add_current_car.loading_wheel.visible? }
end

Then(/^I will see that my car details are incomplete with (.*)$/) do |feedback|
  site.my_vw.add_current_car.scroll_up
  steps %(
      Then I will see that my car details are incomplete with:
      | Feedback    |
      | #{feedback} |
        )
end

Then (/^I will see that my car details are (?:incomplete|incorrect) with:$/) do |table|
  add_car = site.my_vw.add_current_car_step_1
  Watir::Wait.until { add_car.my_car_details_errors.visible? }
  expect(add_car.my_car_details_errors.visible?).to eq(true)
  table.hashes.each_with_index do |hash, index|
    Watir::Wait.until { add_car.my_car_details_errors.li(index: index).text == hash['Feedback'] }
    expect(add_car.my_car_details_errors.li(index: index).text).to eq(hash['Feedback'])
  end
end

Then(/^I will see my car name validation feedback (.*)$/) do |feedback|
  add_car = site.my_vw.add_current_car_step_1
  Timeout.timeout(3) { sleep 1 unless add_car.car_name_validation_message.text == feedback }
  expect(add_car.car_name_validation_message.when_present.text).to eq(feedback)
end

When(/^I update (model|derivative|date of registration|engine size|my car name) to (.*)/) do |field, value|
  add_car = site.my_vw.add_current_car_step_1
  if field =~ /model/
    add_car.model_field.when_present.set(value)
  elsif field =~ /derivative/
    add_car.derivative_field.when_present.set(value)
  elsif field =~ /engine size/
    add_car.engine_size_field.when_present.set(value)
  elsif field =~ /date of registration/
    date_reg = value.split(%r{/}).collect(&:strip)
    add_car.clear_date_registered_day
    add_car.date_registered_day.when_present.send_keys(date_reg[0])
    add_car.clear_date_registered_month
    add_car.date_registered_month.when_present.send_keys(date_reg[1])
    add_car.clear_date_registered_year
    add_car.date_registered_year.when_present.send_keys(date_reg[2])
  else
    add_car.my_car_name_field.when_present.set(value)
  end
end

When(/^I clear (model|derivative|date of registration|engine size|my car name)$/) do |field|
  add_car = site.my_vw.add_current_car_step_1
  if field =~ /model/
    add_car.model_field.when_present.clear
  elsif field =~ /derivative/
    add_car.derivative_field.when_present.clear
  elsif field =~ /engine size/
    add_car.engine_size_field.when_present.clear
  elsif field =~ /date of registration/
    add_car.clear_date_registered_day
    add_car.clear_date_registered_month
    add_car.clear_date_registered_year
  else
    add_car.my_car_name_field.when_present.clear
  end
end

When(/^I update year of manufacture to (.*)$/) do |year|
  site.my_vw.add_current_car_step_1.year_manufacture_options(year)
end

When(/^I update fuel type to (Petrol|Diesel|Hybrid|Electric)$/) do |fuel_type|
  add_car = site.my_vw.add_current_car_step_1
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
  add_car = site.my_vw.add_current_car_step_1
  if transmission =~ /Manual/
    add_car.transmission_manual.click
  elsif transmission =~ /Automatic/
    add_car.transmission_automatic.click
  end
end

When(/^I add (.*) into the registration field$/) do |registration|
  @reg_num = registration
  site.my_vw.add_current_car_step_1.registration_text_field.when_present.set(@reg_num)
end

When(/^I select the back button$/) do
  site.my_vw.add_current_car.back_button.when_present.click
end

Then(/^I will see popup asking (.*$)/) do |overlay_title|
  add_car = site.my_vw.add_current_car
  expect(add_car.leave_overlay.visible?).to be true
  expect(add_car.leave_overlay_title.text).to eq(overlay_title)
end

When(/^I select the (Cancel|I'm sure) button$/) do |button|
  if button =~ /Cancel/
    site.my_vw.add_current_car.cancel_back_button.when_present.click
  else
    site.my_vw.add_current_car.confirm_back_button.when_present.click
  end
end

When(/^I click the calender date picker$/) do
  site.my_vw.add_current_car_step_1.date_picker.click
end

When(/^I choose year range (.*)$/) do |range|
  site.my_vw.add_current_car_step_1.go_back_to_year_range(range)
end

Then(/^I'm presented with all the years between (\d+)\-(\d+)$/) do |first_year, last_year|
  add_car = site.my_vw.add_current_car_step_1
  expect(add_car.check_years_range.first).to eq(first_year)
  expect(add_car.check_years_range.last).to eq(last_year)
end

When(/^I choose year (\d+)$/) do |year|
  site.my_vw.add_current_car_step_1.year_of_registration(year).click
end

Then(/^I'm presented with all the months of (\d+)$/) do |year|
  add_car = site.my_vw.add_current_car_step_1
  expect(add_car.date_picker_current_year.text).to eq(year)
  expect(add_car.check_months_range).to eq(%w(Jan
                                              Feb
                                              Mar
                                              Apr
                                              May
                                              Jun
                                              Jul
                                              Aug
                                              Sep
                                              Oct
                                              Nov
                                              Dec))
end

When(/^I choose the month of (.*)$/) do |month|
  site.my_vw.add_current_car_step_1.month_of_registration(month).click
end
Then(/^I'm presented with all the days of (.*) between (\d+)\-(\d+)$/) do |month_year, first_day, last_day|
  add_car = site.my_vw.add_current_car_step_1
  expect(add_car.date_picker_current_month.text).to eq(month_year)
  expect(add_car.check_month_days_range.first.text).to eq(first_day)
  expect(add_car.check_month_days_range.last.text).to eq(last_day)
end

When(/^I choose the (\d+)(?:st|rd|nd|th)$/) do |day|
  site.my_vw.add_current_car_step_1.day_of_registration(day).click
end

Then(/^I will see date of registration is set to (\d+)\/(\d+)\/(\d+)$/) do |day, month, year|
  add_car = site.my_vw.add_current_car_step_1
  expect(add_car.date_registered_day.value).to eq(day)
  expect(add_car.date_registered_month.value).to eq(month)
  expect(add_car.date_registered_year.value).to eq(year)
end

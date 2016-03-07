Then(/^I have chosen my retailer as (.*)$/) do |retailer|
  steps %(
          When I select continue to step 2
          And I search for my local VW retailer by location with #{retailer}
          And I click lookup
          )
end

Then(/^I will see a summary of my retailer - step 2:$/) do |table|
  add_car = site.my_vw.add_current_car_step_3
  Watir::Wait.until { add_car.step_2_summary.visible? }
  expect(add_car.step_2_summary.present?).to be true
  table.hashes.each do |hash|
    expect(add_car.step_2_retailer_name.text).to eq(hash['Retailer name'])
    expect(add_car.step_2_retailer_telephone.text).to eq(hash['Telephone number'])
    expect(add_car.step_2_retailer_email.text).to eq(hash['Email address'])
  end
end

Then(/^I will see a form (?:to add|with) my address details:$/) do |table|
  add_car = site.my_vw.add_current_car_step_3
  field_value = []
  Watir::Wait.until { add_car.owner_postcode_lookup.present? }
  table.hashes.each do |hash|
    field_value << add_car.owner_address_field_values(hash['Field'], hash['Value'])
    if hash['Mandatory'] == 'Yes'
      expect(add_car.label_for_field(hash['Field']).include? '*').to be true
    else
      expect(add_car.label_for_field(hash['Field']).include? '*').to be false
    end
  end
  expect(field_value.flatten.count).to eq(0), "Failed due to the following: #{field_value.flatten}"
end

Given(/^my details will still be (?:the same|successfully updated to):$/) do |table|
  token = site.my_vw.my_vw_api.get_login_token(@account[:username], @account[:password])
  address = site.my_vw.my_vw_api.get_user_details(@account[:uuid], token)
  table.hashes.each do |hash|
    field_value = hash['Value']
    field_value = nil if field_value == 'empty'
    case hash['Field']
    when 'Postcode'
      expect(address['details']['postcode']).to eq(field_value)
    when 'House Name / no'
      expect(address['details']['houseNumber']).to eq(field_value)
    when 'Address 1'
      expect(address['details']['street']).to eq(field_value)
    when 'Address 2'
      expect(address['details']['street2']).to eq(field_value)
    when 'Town / City'
      expect(address['details']['city']).to eq(field_value)
    when 'County'
      expect(address['details']['county']).to eq(field_value)
    end
  end
end

Given(/^postcode lookup is (disabled|enabled)$/) do |lookup|
  add_car = site.my_vw.add_current_car_step_3
  if lookup == 'disabled'
    expect(add_car.owner_postcode_lookup.enabled?).to be false
  else
    expect(add_car.owner_postcode_lookup.enabled?).to be true
  end
end

When(/^I select lookup$/) do
  3.times { site.my_vw.add_current_car_step_3.owner_postcode_lookup.click }
end

When(/^I select (Skip & Finish|Finish)$/) do |finish_button|
  add_car = site.my_vw.add_current_car_step_3
  if finish_button == 'Finish'
    add_car.step_3_finish_button.when_present.click
  elsif finish_button == 'Skip & Finish'
    add_car.step_3_skip_finish_button.when_present.click
  end
end

Then(/^I will be on my car details summary$/) do
  expect(site.my_vw.add_current_car_step_3.my_car_added.present?).to be true
end

Then(/^my retailer is (.*) is displayed$/) do |retailers_name|
  expect(site.my_vw.current_car_dashboard.retailer_address_name.text).to eq(retailers_name)
end

Then(/^I will see address error message:$/) do |table|
  add_car = site.my_vw.add_current_car_step_3
  Watir::Wait.while { site.my_vw.add_current_car.loading_wheel.visible? }
  Watir::Wait.until { add_car.owner_address_error_feedback.visible? }
  table.hashes.each_with_index do |hash, index|
    Watir::Wait.until { add_car.owner_address_error_feedback.text.include? hash['Feedback'] }
    expect(add_car.owner_address_error_feedback.li(index: index).text).to eq(hash['Feedback'])
  end
end

Then(/^I will see address error message with (.*)$/) do |feedback|
  Watir::Wait.while { site.my_vw.add_current_car.loading_wheel.visible? }
  steps %(
      Then I will see address error message:
      | Feedback    |
      | #{feedback} |
        )
end

Then(/^I will see a pop with (.*):$/) do |header, table|
  add_car = site.my_vw.add_current_car_step_3
  Watir::Wait.until { add_car.error_pop_up.visible? }
  expect(add_car.error_pop_up.present?).to be true
  expect(add_car.error_pop_up.h2.text).to eq(header)
  table.raw.each do |column|
    expect(add_car.error_pop_up.p.text).to eq(column[0])
  end
end

When(/^I dismiss the pop up$/) do
  site.my_vw.add_current_car_step_3.error_pop_up_button.when_present.click
end

When(/^I (?:update|enter) (Postcode|House Name|Address 1|Address 2|Town|County) with (.*)$/) do |field, value|
  add_car = site.my_vw.add_current_car_step_3
  Watir::Wait.while { site.my_vw.add_current_car.loading_wheel.visible? }
  case field
  when 'Postcode'
    add_car.owner_postcode.when_present.set(value)
  when 'House Name'
    add_car.owner_house_number.set(value)
  when 'Address 1'
    add_car.owner_address_1.set(value)
  when 'Address 2'
    add_car.owner_address_2.set(value)
  when 'Town'
    add_car.owner_city.set(value)
  when 'County'
    add_car.owner_county.set(value)
  end
end

When(/^I select change step (\d+)$/) do |step|
  add_car = site.my_vw
  case step
  when '1'
    add_car.add_current_car_step_2.change_step_1.when_present.click
  when '2'
    add_car.add_current_car_step_3.change_step_2.when_present.click
  end
  Watir::Wait.while { site.my_vw.add_current_car.loading_wheel.visible? }
end

Then(/^I will not see any error messages$/) do
  expect(site.my_vw.add_current_car_step_3.owner_address_error_feedback.present?).to be false
end

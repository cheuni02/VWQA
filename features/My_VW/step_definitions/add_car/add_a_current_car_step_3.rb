Then(/^I will see a summary of my retailer - step 2:$/) do |table|
  add_car = site.my_vw.add_current_car
  Timeout.timeout(3) { sleep 1 unless add_car.step_2_summary.visible? }
  expect(add_car.step_2_summary.present?).to be true
  table.hashes.each do |hash|
    expect(add_car.step_2_retailer_name.text).to eq(hash['Retailer name'])
    expect(add_car.step_2_retailer_telephone.text).to eq(hash['Telephone number'])
    expect(add_car.step_2_retailer_email.text).to eq(hash['Email address'])
  end
end

Then(/^I will see a form to add my address details:$/) do |table|
  add_car = site.my_vw.add_current_car
  field_value = []
  table.hashes.each do |hash|
    field_value << add_car.owner_address_field_values(hash['Field'], hash['Value'])
    if hash['Mandatory'] == '✓'
      expect(add_car.label_for_field(hash['Field']).include? '*').to be true
    else
      expect(add_car.label_for_field(hash['Field']).include? '*').to be false
    end
  end
  expect(field_value.flatten.count).to eq(0), "Failed due to the following: #{field_value.flatten}"
end

Given(/^I postcode lookup is (disabled|enabled)$/) do |lookup|
  add_car = site.my_vw.add_current_car
  if lookup == 'disabled'
    expect(add_car.owner_postcode_lookup.enabled?).to be false
  else
    expect(add_car.owner_postcode_lookup.enabled?).to be true
  end
end

When(/^I select lookup$/) do
  site.my_vw.add_current_car.owner_postcode_lookup.click
end

When(/^I select Finish$/) do
  site.my_vw.add_current_car.step_3_finish_button.when_present.click
end

Then(/^I will see address error message:$/) do |table|
  add_car = site.my_vw.add_current_car
  Timeout.timeout(3) { sleep 1 unless add_car.owner_address_error_feedback.visible? }
  table.hashes.each_with_index do |hash, index|
    expect(add_car.owner_address_error_feedback.li(index: index).text).to eq(hash['Feedback'])
  end
end

When(/^I enter (.*) into (Postcode|House Name|Address 1|Address 2|Town|County)$/) do |value, field|
  add_car = site.my_vw.add_current_car
  case field
  when 'Postcode'
    add_car.owner_postcode.set(value)
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

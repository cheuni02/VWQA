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

Given(/^postcode lookup is (disabled|enabled)$/) do |lookup|
  add_car = site.my_vw.add_current_car_step_3
  if lookup == 'disabled'
    expect(add_car.owner_postcode_lookup.enabled?).to be false
  else
    expect(add_car.owner_postcode_lookup.enabled?).to be true
  end
end

When(/^I select lookup$/) do
  site.my_vw.add_current_car_step_3.owner_postcode_lookup.click
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
  @car_id = site.my_vw.add_current_car_step_3.car_id
  expect(site.my_vw.add_current_car_step_3.my_car_added.present?).to be true
end

Then(/^my car name (.*) is displayed$/) do |car_name|
  expect(site.my_vw.add_current_car_step_3.my_car_name_in_summary.text).to eq(car_name)
end

Then(/^my retailer is (.*) is displayed$/) do |retailers_name|
  expect(site.my_vw.add_current_car_step_3.my_retailer_name.text).to eq(retailers_name)
end

Then(/^I will see address error message:$/) do |table|
  add_car = site.my_vw.add_current_car_step_3
  Watir::Wait.until { add_car.owner_address_error_feedback.visible? }
  table.hashes.each_with_index do |hash, index|
    Watir::Wait.until { add_car.owner_address_error_feedback.text.include? hash['Feedback'] }
    expect(add_car.owner_address_error_feedback.li(index: index).text).to eq(hash['Feedback'])
  end
end

Then(/^I will see address error message with (.*)$/) do |feedback|
  steps %(
      Then I will see address error message:
      | Feedback    |
      | #{feedback} |
        )
end

When(/^I (?:update|enter) (Postcode|House Name|Address 1|Address 2|Town|County) with (.*)$/) do |field, value|
  add_car = site.my_vw.add_current_car_step_3
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

Given(/^I have logged in with my address completed previously and I'm on step 3$/) do
  steps %(
    Given I am on the Volkswagen Homepage
    And I login into my account with username: AutomatedToastUser1455294949@example.com and password: Abcd!2345
    And I will be logged into my account
    And I go to add a new car
    And I select the A car I own button
    And I will see a registration field
    And I add NU61OJG into the registration field
    And I lookup the registration
    And I select continue to step 2
    And I search for my local VW retailer by location with Bath
    And I click lookup
    When I select continue to step 3
        )
end

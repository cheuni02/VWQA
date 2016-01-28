Then (/^I can not continue until I provide search criteria for my retailer$/) do
  service_booking = site.service_booking.step3
  expect(service_booking.location_lookup_button.enabled?).to be(false)
end

When (/^I search for my local VW retailer by (location|name) with (.*)$/) do |search_type, search|
  service_booking = site.service_booking.step3
  if search_type == 'location'
    service_booking.search_by_location_field.set(search)
  else
    service_booking.search_by_name_field.set(search)
  end
end

And (/^I click lookup$/) do
  service_booking = site.service_booking.step3
  service_booking.location_lookup_button.when_present.click
  Watir::Wait.while { service_booking.loading_wheel.visible? }
end

Then (/^I will (not see|see) search suggestions$/) do |drop_down|
  service_booking = site.service_booking.step3
  if drop_down == 'not see'
    expect(service_booking.retailer_dropdown.present?).to be(false)
  else
    expect(service_booking.retailer_dropdown.present?).to be(true)
  end
end

When (/^I select the ([1-9])(?:st|rd|nd|th) option in the list of retailers$/) do |retailer|
  service_booking = site.service_booking.step3
  selected_retailer_index = retailer.to_i - 1
  selected_retailer = service_booking.retailer_in_list(selected_retailer_index)
  @retailer = selected_retailer.text
  selected_retailer.click
  Watir::Wait.while { service_booking.loading_wheel.visible? }
end

Then (/^I'm presented with my choice of VW retailer$/) do
  expect(site.service_booking.step3.retailer_group_list.h3.text).to eq(@retailer)
end

And (/^I select the map tab$/) do
  site.service_booking.step3.map_tab.click
end

Then (/^I'm presented with a map view of local VW dealers$/) do
  add_car = site.service_booking.step3
  Timeout.timeout(3) { sleep 1 unless add_car.retailer_map.visible? }
  expect(add_car.retailer_map.present?).to be(true)
end

Then (/my choice of retailer is under the map$/) do
  expect(site.service_booking.step3.retailer_map_selected).to eq(@retailer)
end

Then (/^the map has a pin where my nearest retailer is located$/) do
  local_retailer = site.service_booking.step3
  expect(local_retailer.pin_on_map_latitude).to eq '56.10895'
  expect(local_retailer.pin_on_map_longitude).to eq '-3.91654'
end

Then (/^I will see message (.*) matching my search$/) do |error_message|
  expect(site.service_booking.step3.retailer_error_message.present?).to be(true)
  expect(site.service_booking.step3.retailer_error_message.text).to eq(error_message)
end

Then (/^I'm presented with a list view of (.*) local VW dealers$/) do |list_length|
  expect(site.service_booking.step3.retailer_error_message.present?).to be(false)
  expect(site.service_booking.step3.number_of_retailers_in_list).to eq(list_length.to_i)
end

When (/^I select the ([1-5])(?:st|rd|nd|th) local retailer$/) do |retailer|
  local_retailer = site.service_booking.step3.local_retailer(retailer.to_i - 1)
  @retailer = local_retailer.h3.text
  local_retailer.click
end

Then (/^my choice of retailer will be selected$/) do
  add_car = site.service_booking.step3
  Timeout.timeout(3) { sleep 1 unless add_car.selected_retailer.h3.text == @retailer }
  expect(add_car.selected_retailer.h3.text).to eq(@retailer)
end
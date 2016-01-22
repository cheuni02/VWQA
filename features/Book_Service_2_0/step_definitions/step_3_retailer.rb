Then (/^my personal details will be displayed in summary$/) do
  service_booking = site.service_booking.step3
  expect(service_booking.summary_title.text).to eq(@account[:title])
  expect(service_booking.summary_name.text).to eq(@account[:firstname])
  expect(service_booking.summary_surname.text).to eq(@account[:lastname])
  expect(service_booking.summary_mobile.text).to eq(@account[:optional_details][:phone1])
  expect(service_booking.summary_email.text).to eq(@account[:username])
end

Then (/^my address details will be displayed in summary$/) do
  service_booking = site.service_booking.step3
  expect(service_booking.summary_house_number.text).to eq(@account[:optional_details][:house_number])
  expect(service_booking.summary_street.text).to eq(@account[:optional_details][:street])
  expect(service_booking.summary_town.text).to eq(@account[:optional_details][:city])
  expect(service_booking.summary_postcode.text).to eq(@account[:optional_details][:postcode])
end

Given (/^I have completed Step 2$/) do
  steps %(
    Given I select my title Mr
    And I fill in my personal details John, Doe, 07889093223 and john_doe@tribalworldwide.com
    And I fill in my address information G2 3PS, 1, Hope Street and GLASGOW
        )
end

Given (/^as a logged in user without a registered car I have completed steps 1 and 2$/) do
  steps %(
    Given Step 1 is complete after I have logged in
    And I enter a vehicle valid registration VU12WGE
    And I click lookup button to find my registration
    And I select Next - My details
    And I select Next - Select retailer
    And Step 3 of book a service has loaded
        )
end

Given (/^as a logged in user with a registered car I have completed steps 1 and 2$/) do
  steps %(
    Given Step 1 is complete after I have logged in
    When I select Next - My details
    Then Step 2 of book a service has loaded
    When I select Next - Select retailer
    Then Step 3 of book a service has loaded
        )
end

Then(/^my previously saved retailer is presented$/) do
  service_booking = site.service_booking.step3
  expect(service_booking.saved_retailer.present?).to be(true)
  @saved_retailer_name = service_booking.saved_retailer_name.text
  expect(@saved_retailer_name).to eq('Ipswich Volkswagen')
end

When (/^I select edit my retailer$/) do
  site.service_booking.step3.edit_saved_retailer.click
end

Then(/^my previously saved retailer is still selected$/) do
  expect(site.service_booking.step3.preferred_retailer_name.h3.text).to eq(@saved_retailer_name)
end

Given(/^my postcode is pre-populated in search$/) do
  expect(site.service_booking.step3.search_by_location_field.value).to eq(@account[:optional_details][:postcode])
end

Then (/^Step 3 of book a service has loaded$/) do
  site.service_booking.step3.page_loaded?
end

Then (/^I can not continue until I provide search criteria for my retailer$/) do
  service_booking = site.service_booking.step3
  expect(service_booking.location_lookup_button.enabled?).to be(false)
  expect(service_booking.step4_button.enabled?).to be(false)
end

When (/^I search for my local VW retailer by (location|name) with (.*)$/) do |search_type, search|
  service_booking = site.service_booking.step3
  if search_type == 'location'
    service_booking.search_by_location_field.set(search)
  else
    service_booking.search_by_name_field.set(search)
  end
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
  selected_retailer = service_booking.retailer_in_list(retailer.to_i - 1)
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

And (/^I click lookup$/) do
  service_booking = site.service_booking.step3
  service_booking.location_lookup_button.when_present.click
  Watir::Wait.while { service_booking.loading_wheel.visible? }
end

When (/^I select the ([1-5])(?:st|rd|nd|th) local retailer$/) do |retailer|
  local_retailer = site.service_booking.step3.local_retailer(retailer.to_i - 1)
  @retailer = local_retailer.h3.text
  local_retailer.click
end

Then (/^my choice of retailer will be selected$/) do
  expect(site.service_booking.step3.selected_retailer.h3.text).to eq(@retailer)
end

Then (/^I'm presented with a list view of (.*) local VW dealers$/) do |list_length|
  expect(site.service_booking.step3.number_of_retailers_in_list).to eq(list_length.to_i)
end

Then (/^I'm presented with a map view of local VW dealers$/) do
  expect(site.service_booking.step3.retailer_map.present?).to be(true)
end

Then (/^the map has a pin where my nearest retailer is located$/) do
  local_retailer = site.service_booking.step3
  expect(local_retailer.pin_on_map_latitude).to eq '51.55582'
  expect(local_retailer.pin_on_map_longitude).to eq '-0.39043'
end

Then (/^I will see message that no retailers found matching my search$/) do
  expect(site.service_booking.step3.retailer_error_message.present?).to be(true)
end

When(/^I select edit my personal details$/) do
  site.service_booking.step3.edit_personal_button.click
end

When(/^I select edit my address details$/) do
  site.service_booking.step3.edit_address_button.click
end

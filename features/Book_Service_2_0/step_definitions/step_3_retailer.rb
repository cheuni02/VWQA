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

Then (/^Step 3 of book a service has loaded$/) do
  site.service_booking.step3.page_loaded?
end

Then (/^I can not continue until I provide search criteria for my retailer$/) do
  service_booking = site.service_booking.step3
  expect(service_booking.location_lookup_button.enabled?).to eq(false)
  service_booking.step4_button.click
  expect(service_booking.retailer_form_errors.wait_until_present).to eq(true)
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
    expect(service_booking.retailer_dropdown.present?).to eq(false)
  else
    expect(service_booking.retailer_dropdown.present?).to eq(true)
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
  expect(site.service_booking.step3.current_selected_retailer.text).to eq(@retailer)
end

And (/^I click lookup$/) do
  service_booking = site.service_booking.step3
  service_booking.location_lookup_button.when_present.click
  Watir::Wait.while { service_booking.loading_wheel.visible? }
end

When (/^I select the ([1-5])(?:st|rd|nd|th) local retailer$/) do |retailer|
  local_retailer = site.service_booking.step3.local_retailer(retailer.to_i - 1)
  @retailer = local_retailer.h4.text
  local_retailer.click
end

Then (/^my choice of retailer will be selected$/) do
  expect(site.service_booking.step3.selected_retailer.h4.text).to eq(@retailer)
  expect(site.service_booking.step3.selected_retailer.address.present?).to be(true)
end

Then (/^I'm presented with a list view of (.*) local VW dealers$/) do |list_length|
  expect(site.service_booking.step3.number_of_retailers_in_list).to eq(list_length.to_i)
end

Then (/^I will see message that no retailers found matching my search$/) do
  expect(site.service_booking.step3.retailer_error_message.present?).to eq(true)
end

When(/^I select edit my personal details$/) do
  site.service_booking.step3.edit_details_button.click
end
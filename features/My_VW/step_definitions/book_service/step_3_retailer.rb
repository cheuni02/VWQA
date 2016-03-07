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
  expect(service_booking.summary_house_number.text).to eq(@account[:optional_details][:house_number_preview])
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

When(/^I select edit my personal details$/) do
  site.service_booking.step3.edit_personal_button.click
end

When(/^I select edit my address details$/) do
  site.service_booking.step3.edit_address_button.click
end

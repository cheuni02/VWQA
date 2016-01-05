Given /^I have completed Step 1$/ do
  site.homepage.visit
  site.primary_nav.book_service
  service_booking = site.service_booking.step1
  @reg = 'VU12WGE'
  service_booking.registration_field.when_present.set('VU12WGE')
  service_booking.registration_lookup.when_present.click
  Watir::Wait.while { service_booking.loading_wheel.visible? }
end

When /^Step 2 of book a service has loaded$/ do
  site.service_booking.step2.page_loaded?
end

Given /^Step 1 is complete after I have logged in$/ do
  steps %(
    Given I am on the Volkswagen Homepage
    When I login into my account
    And I click the book a service button in navigation
        )
end

Then /^I will see my personal details pre-populated$/ do
  service_booking = site.service_booking.step2
  expect(service_booking.title_field.value).to eq(@account[:title])
  expect(service_booking.first_name_field.value).to eq(@account[:firstname])
  expect(service_booking.last_name_field.value).to eq(@account[:lastname])
  expect(service_booking.email_field.value).to eq(@account[:username])
end

Then /^I will see step 1 details in summary/ do
  service_booking = site.service_booking.step2
  expect(service_booking.car_details_section.present?).to eq(true)
  expect(service_booking.car_details_section.present?).to eq(true)
  expect(service_booking.car_reg_details).to eq(@reg)
end

When /^I select Next - Select retailer$/ do
  service_booking = site.service_booking.step2
  service_booking.step2.step3_button.click
  Watir::Wait.while { service_booking.loading_wheel.visible? }
end


Then /^I will see (.*) that my personal details are (?:incomplete|invalid)$/ do |feedback|
  steps %(
    Then  I will see feedback that my personal details are incomplete with:
      | Feedback |
      | #{feedback}  |
        )
end

Then /^I will see feedback that my personal details are incomplete with:$/ do |table|
  service_booking = site.service_booking.step2
  expect(service_booking.personal_details_errors.present?).to eq(true)
  table.hashes.each_with_index do |hash, index|
    expect(service_booking.personal_details_errors.li(index: index).text).to eq(hash['Feedback'])
  end
end

Then /^I will see (.*) (?:that my address details are incomplete|error message)$/ do |feedback|
  steps %(
      And  I will see feedback that my address is incomplete with:
      | Feedback |
      | #{feedback} |
        )
end

Then /^I will see feedback that my address is incomplete with:$/ do |table|
  service_booking = site.service_booking.step2
  expect(service_booking.address_errors.present?).to eq(true)
  table.hashes.each_with_index do |hash, index|
    expect(service_booking.address_errors.li(index: index).text).to eq(hash['Feedback'])
  end
end

When /^I select my(?: title| )(.*)$/ do |title|
  site.service_booking.step2.select_title(title.strip)
end

And /^I fill in my personal details (.*), (.*), (.*) and (.*)$/ do |first_name, last_name, mobile, email|
  site.service_booking.step2.enter_personal_details(first_name, last_name, mobile, email)
end

When /^I fill in the postcode with (.*)$/ do |postcode|
  site.service_booking.step2.postcode_field.set(postcode)
end

When /^I select postcode lookup$/ do
  service_booking = site.service_booking.step2
  service_booking.postcode_lookup.click
  Watir::Wait.while { service_booking.loading_wheel.visible? }
end

And /^I fill in my address information (.*), (.*), (.*) and (.*)$/ do |postcode, house_no, address_line1, city|
  site.service_booking.step2.enter_address_details(house_no, postcode, address_line1, city)
end

Then(/^my address details will be populated:$/) do |table|
  service_booking = site.service_booking.step2
  table.hashes.each do |hash|
    expect(service_booking.address_line_1_field.value).to eq(hash['Address Line 1'])
    expect(service_booking.city_field.value).to eq(hash['City'])
    expect(service_booking.county_field.value).to eq(hash['County'])
  end
end

Then(/^I will see my personal details in summary:$/) do |table|
  service_booking = site.service_booking.step3
  table.hashes.each do |hash|
    expect(service_booking.summary_title).to eq(hash['Title'])
    expect(service_booking.summary_name).to eq(hash['Name'])
    expect(service_booking.summary_surname).to eq(hash['Surname'])
    expect(service_booking.summary_mobile).to eq(hash['Mobile'])
    expect(service_booking.summary_email).to eq(hash['Email'])
  end
end

Then(/^I will see my address details in summary:$/) do |table|
  service_booking = site.service_booking.step3
  table.hashes.each do |hash|
    expect(service_booking.summary_house_number).to eq(hash['House No'])
    expect(service_booking.summary_street).to eq(hash['Street'])
    expect(service_booking.summary_town).to eq(hash['City'])
    expect(service_booking.summary_postcode).to eq(hash['Postcode'])
  end
end

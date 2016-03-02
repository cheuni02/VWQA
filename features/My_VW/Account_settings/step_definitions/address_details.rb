Given /^I visit My Volkswagen login page$/ do
  site.my_vw.login.visit
end

And /^I login with my credentials$/ do
  site.my_vw.login.login(@account[:username], @account[:password])
end

When /^I go to the My account section$/ do
  site.my_vw.account_settings.visit
end

Then /^I should see address details section to be displayed with correct fields:$/ do |table|
  site.my_vw.account_settings.personal_details.present?
  fields = Array.new
  fields = site.my_vw.account_settings.get_address_details_fields
  table.hashes.each do |hash|
    expect(fields).to include (hash['Field'])
  end
end

And /^(view|edit) mode will be active for address detail form$/ do |mode|
  if mode == 'view'
    expect(site.my_vw.account_settings.address_details_view_mode).to eq 'block'
    expect(site.my_vw.account_settings.address_details_edit_mode).to eq 'none'
  else
    expect(site.my_vw.account_settings.address_details_view_mode).to eq 'none'
    expect(site.my_vw.account_settings.address_details_edit_mode).to eq 'block'
  end
end

And /^address details fields in the form should be populated with correct data$/ do
  address_details = site.my_vw.account_settings
  account_details = @account[:optional_details]
  expect(address_details.house_number_preview.text).to eq(account_details[:house_number])
  expect(address_details.street1_preview.text).to eq(account_details[:street])
  expect(address_details.street2_preview.text).to eq(account_details[:street2])
  expect(address_details.town_preview.text).to eq(account_details[:city])
  expect(address_details.county_preview.text).to eq(account_details[:county])
  expect(address_details.postcode_preview.text).to eq(account_details[:postcode])
end

When(/^I toggle my address detail's$/) do
  site.my_vw.account_settings.toggle_address_view.click
end

When(/^I set my address (.*) to (.*)$/) do |field, value|
  address_details = site.my_vw.account_settings
  case field
    when /postcode/
      address_details.postcode.set(value)
  end
end

When(/^I click postcode lookup$/) do
  site.my_vw.account_settings.postcode_lookup.click
end
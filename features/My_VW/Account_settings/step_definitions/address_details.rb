
Given /^I visit My Volkswagen login page$/ do
  site.my_vw.login.visit
end

And /^I login with my credentials$/ do
  site.my_vw.login.login(@account[:username],@account[:password])
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

And /^view mode should be active by default for address detail form$/ do
  expect(site.my_vw.account_settings.address_details_view_mode).to eq'block'
  expect(site.my_vw.account_settings.address_details_edit_mode).to eq 'none'
end

And /^address details fields in the form should be populated with correct data$/ do
  address_details = site.my_vw.account_settings
  expect(address_details.house_number_value).to eq(@account[:optional_details][:house_number])
  expect(address_details.street1_value).to eq(@account[:optional_details][:street])
  expect(address_details.street2_value).to eq(@account[:optional_details][:street2])
  expect(address_details.town_value).to eq(@account[:optional_details][:city])
  expect(address_details.county_value).to eq(@account[:optional_details][:county])
  expect(address_details.postcode_value).to eq(@account[:optional_details][:postcode])
end
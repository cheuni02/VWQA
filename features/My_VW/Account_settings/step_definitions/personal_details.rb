
Given /^I visit the My Volkswagen login page$/ do
  site.my_vw.login.visit
end

And /^I login with correct credentials$/ do
  site.my_vw.login.login(@account[:username],@account[:password])
end

When /^I navigate to the My account section$/ do
  site.my_vw.account_settings.visit
end

Then /^I should see personal details section to be displayed with correct fields:$/ do |table|
  site.my_vw.account_settings.personal_details.present?
  fields = Array.new
  fields = site.my_vw.account_settings.get_personal_details_fields
  table.hashes.each do |hash|
    expect(fields).to include (hash['Field'])
  end
end

And /^view mode should be active by default for personal details form$/ do
  expect(site.my_vw.account_settings.personal_details_view_mode).to eq'block'
  expect(site.my_vw.account_settings.personal_details_edit_mode).to eq 'none'
end

And /^personal details fields in the form should be populated with correct data$/ do
    date = Date.strptime(@account[:optional_details][:date_of_birth],'%F %T').strftime("%d %b %Y")
    expect(site.my_vw.account_settings.name_value[0]).to eq(@account[:firstname])
    expect(site.my_vw.account_settings.name_value[1]).to eq(@account[:lastname])
    expect(site.my_vw.account_settings.home_phone_value).to eq(@account[:optional_details][:phone1])
    expect(site.my_vw.account_settings.mobile_phone_value).to eq(@account[:optional_details][:phone2])
    expect(site.my_vw.account_settings.work_phone_value).to eq(@account[:optional_details][:work_phone])
    expect(site.my_vw.account_settings.date_of_birth_value).to eq(date)
end
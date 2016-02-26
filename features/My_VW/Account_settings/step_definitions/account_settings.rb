
Given /^I visit login page$/ do
  site.my_vw.login.visit
end

And /^I login with valid credentials$/ do
  site.my_vw.login.login(@account[:username],@account[:password])
end

When /^I am viewing My account$/ do
  site.my_vw.account_settings.visit
  expect(site.my_vw.account_settings.my_account_title.present?).to be true
end

Then /^I should see my Email and Password displayed in account settings section$/ do
  expect(site.my_vw.account_settings.email_field).to eq'Email:'
  expect(site.my_vw.account_settings.password_field).to eq'Password:'
end

And /^my password should be masked$/ do
  expect(site.my_vw.account_settings.password_value).to eq'********'
end

And /^email address should be correct$/ do
  expect(site.my_vw.account_settings.email_value[1]).to eq(@account[:username])
end

And /^view mode should be active by default for account settings form$/ do
  expect(site.my_vw.account_settings.account_settings_view_mode).to eq'block'
  expect(site.my_vw.account_settings.account_settings_edit_mode).to eq'none'
end
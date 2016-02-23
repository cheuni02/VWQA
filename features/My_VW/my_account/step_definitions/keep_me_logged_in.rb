
Given /^I have activated the Keep me logged in option$/ do
  site.my_vw.login.visit
  site.my_vw.login.keep_me_logged_in_check
end

And /^I logged in$/ do
  site.my_vw.login.login(@account[:username],@account[:password])
  expect(site.my_vw.login.logged_in_cookie_set?).not_to be_nil
end

And /^the keep me logged in cookie should be set in my browser$/ do
  expect(site.my_vw.login.keep_me_logged_in_cookie_set?).to_not be_nil
end

When /^I log out$/ do
  site.my_vw.login.logout.when_present.click
end

And /^navigate again to the login screen$/ do
  site.my_vw.login.visit
  expect(site.my_vw.login.page_loaded?).to be true
end

Then /^I should be asked to enter my email and my password$/ do
  expect(site.my_vw.login.username_field.value.empty?).to be true
  expect(site.my_vw.login.password_field.value.empty?).to be true
  expect(site.my_vw.login.logged_in_cookie_set?).to be_nil
  expect(site.my_vw.login.keep_me_logged_in_cookie_set?).to be_nil
end

And /^the Keep me logged in option should be deselected$/ do
  expect(site.my_vw.login.keep_me_logged_in_set?).to be false
end

Given /^I am logged in, with the "Keep me logged in" option active$/ do
  step "I have activated the Keep me logged in option"
  step "I logged in"
end

And /^I navigate to My account page$/ do
  site.my_vw.my_account.visit
  expect(site.my_vw.my_account.my_account_page_present?).to be true
  @url = URI::parse(site.my_vw.login.current_url).path
end

And /^I close the tab$/ do
  site.my_vw.login.open_new_window
  site.my_vw.login.close_first_window
end

When /^I navigate back to the website using the same browser$/ do
  site.visit_page(@url)
end

Then /^I should be automatically logged in$/ do
  expect(site.my_vw.login.account_navigation_bar.present?).to be true
  expect(site.my_vw.login.logged_in_cookie_set?).not_to be_nil
  expect(site.my_vw.login.keep_me_logged_in_cookie_set?).not_to be_nil
end

And /^I expect to be on My account page$/ do
  expect(site.my_vw.my_account.my_account_page_present?).to be true
end

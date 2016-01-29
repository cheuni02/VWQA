Given /^i am on the My VW Login Page$/ do
  site.my_vw.login.visit
end

When /^i enter my registered account email address$/ do
  site.my_vw.login.set_email(@account[:username])
end

And /^i enter my accounts correct password$/ do
  site.my_vw.login.set_password(@account[:password])
end

And /^i submit my attempt to login$/ do
  site.my_vw.login.do_login
end

Then /^i should be logged into the My Volkswagen section$/ do
  expect{site.my_vw.profile.page_loaded?}.to_not raise_error
end

When /^i enter the random unregistered email address "([^"]*)"$/ do |email|
  site.my_vw.login.set_email(email)
end

When /^i enter a random valid password for this account$/ do
  site.my_vw.login.set_password("Abcdefghghgh")
end

Then /^i should see a login error appear in my browser:$/ do |error|
  expect(site.my_vw.login.login_error_message.when_present.text).to eq error
end

# Given /^i have previously submitted (\d+) invalid logins$/ do |number|
#   number.to_i.times do
#     step "i enter my registered account email address"
#     step "i enter a random valid password for this account"
#     step "i submit my attempt to login"
#     site.my_vw.login.visit
#   end
#   @logins = number
# end
#
# Then /^i should see this error message for (\d+) incorrect login attempts:$/ do |attempts, table|
#
#   table.hashes.each_with_index do |hash, index|
#     if index.to_i == attempts.to_i
#       expect(site.my_vw.login.login_error_message.when_present.text).to eq hash['Feedback']
#     end
#   end
# end
#
# Then /^i should see an error page in my browser informing me that my account is locked$/ do
#   expect{site.my_vw.login.lockout_page.wait_until_present}.to_not raise_error
# end
#
# And /^there should be a button to reset my existing password$/ do
#   expect{site.my_vw.login.lockout_page_forgot_pw_link.wait_until_present}.to_not raise_error
# end

When /^i check the Remember me box on the login form$/ do
  site.my_vw.login.remember_me_checkbox.when_present.set
end

And /^the remember me cookie should be set in my browser$/ do
  expect(site.my_vw.login.remember_me_cookie_set?).to_not be_nil
end

When /^i click on the link to go to the reset password form$/ do
  site.my_vw.login.forgot_password_link.when_present.click
end

Then /^i should see the forgot password form load in my browser$/ do
  expect{site.my_vw.login.forgot_password_email_field}.to_not raise_error
end

When /^i click on the link to go to the registration page$/ do
  site.my_vw.login.create_account_link.when_present.click
end

Then /^i should see the registration form load in my browser$/ do
  expect{site.my_vw.register.password_confirm_new.wait_until_present}.to_not raise_error
end

But /^i then log out from my Volkswagen account$/ do
  site.primary_nav.click_logout
end

Then /^i should find i am no longer signed into my account$/ do
  expect(site.my_vw.login.logged_in_cookie_set?).to be_nil
end

Given /^i have filled in my email (.*)$/ do |email|
  site.my_vw.login.set_email(email)
end

When /^i press login but the validation is not met$/ do
  step "i submit my attempt to login"
end

Then /^i should get the following error message displayed:$/ do |error_message|
  expect(site.my_vw.login.login_error_message.when_present.text).to eq error_message
end

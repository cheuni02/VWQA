Given /^i am on the My VW Login Page$/ do
  site.my_vw.login.visit
end

When /^i enter my regsitered account email address$/ do
  site.my_vw.login.set_email(@account[0])
end

And /^i enter my accounts correct password$/ do
  site.my_vw.login.set_password(@account[1])
end

And /^i submit my attempt to login$/ do
  site.my_vw.login.do_login
end

Then /^i should be logged into the My Volkswagen section$/ do
  expect{site.my_vw.profile.page_loaded?}.to_not raise_error
end

When /^i enter the random unregistered email address "(.*)" do |email|
  site.my_vw.login.set_email(email)
end

And /^i enter a random valid password for this account$/ do
  site.my_vw.login.set_password("Abcdefghghgh")
end

Then /^i should see a login error appear in my browser:$/ do |error|
  expect(site.my_vw.login.login_error_message.when_present.text).to eq error
end

Given /^i have previously submitted (\d+) invalid logins$/ do |number|
  number.to_i.times do
    step "i enter my registered account email address"
    step "i enter a random valid password for this account"
    step "i submit my attempt to login"
  end
  @logins = number
end

Then /^i should see one of these error messages in my browser:$/ do |table|
  STDOUT.puts table.hashes
end

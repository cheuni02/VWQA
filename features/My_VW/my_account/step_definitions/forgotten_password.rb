Given /^i navigate to the forgotten password page$/ do
  site.my_vw.forgotten_password.visit
end

Given /^i navigate to the My VW Login Page$/ do
  site.my_vw.login.visit
end

When /^i click on the Forgotten password link$/ do
  expect { site.my_vw.forgotten_password.forgotten_password.click }.not_to raise_error
end

Then /^the forgotten password page should be loaded$/ do
  expect { site.my_vw.forgotten_password.page_loaded? }.not_to raise_error
end

And /^i should be able to enter the (.*) for the account I want to recover the password for$/ do |email|
  site.my_vw.forgotten_password.set_email(email)
end

When /^click on Send button to receive an email with link to reset my password$/ do
  site.my_vw.forgotten_password.send_email.when_present.click
end

Then /^i should see success page displayed$/ do
  expect(site.my_vw.forgotten_password.success_page_title.present?).to be true
end

When /^i enter invalid email address (.*)$/ do |email_address|
  site.my_vw.forgotten_password.set_email(email_address)
end

Then /^i should get an error (.*) displayed$/ do |error_message|
  expect(site.my_vw.forgotten_password.error_message.when_present.text).to eq (error_message)
end

And /^i can return back to the login page$/ do
  site.my_vw.forgotten_password.return_to_login.click
  expect(site.my_vw.login.page_loaded?).to be true
end

When /^i attempt to recover my password for my email address$/ do
  step 'i navigate to the forgotten password page'
  step "i enter invalid email address #{@account[:username]}"
end

Then /^i should see Request new verification link displayed$/ do
  expect(site.my_vw.forgotten_password.verification_link.present?).to be true
end

And /^i don't change it but i try to login with my old password$/ do
  step 'click on Send button to receive an email with link to reset my password'
  site.my_vw.forgotten_password.login_button.click
end

Then /^I should be able to login successfully$/ do
  site.my_vw.login.login(@account[:username], @account[:password])
  step 'i should be logged into the My Volkswagen section'
end
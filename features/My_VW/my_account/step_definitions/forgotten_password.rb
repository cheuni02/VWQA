
Given /^i navigate to the My VW Login Page$/ do
  site.my_vw.login.visit
end

When /^i click on the "Forgotten password" link$/ do
  expect {site.my_vw.forgotten_password.forgotten_password.click}.not_to raise_error
end

Then /^the forgotten password page should be loaded$/ do
  expect {site.my_vw.forgotten_password.page_loaded?}.not_to raise_error
end

And /^i should be able to enter the (.*) for the account I want to recover the password for$/ do |email|
  site.my_vw.forgotten_password.set_email(email)
end

Then /^click on "Send" button to receive an email with link to reset my password$/ do
  site.my_vw.forgotten_password.send_email.when_present.click
end

And /^i should see success page displayed$/ do
  # Timeout.timeout(3) { sleep 1 unless site.my_vw.forgotten_password.flash_visible?}
  expect(site.my_vw.forgotten_password.success_page_loaded?).to be true
end

When /^i enter invalid email address (.*)$/ do |email_address|
  site.my_vw.forgotten_password.set_email(email_address)
end

Then /^i should get an error (.*) displayed$/ do |error_message|
expect(site.my_vw.forgotten_password.error_message.when_present.text).to eq (error_message)
end

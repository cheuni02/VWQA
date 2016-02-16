
Given /^I have sent an email to change password to my address$/ do
  site.my_vw.forgotten_password.visit
  site.my_vw.forgotten_password.set_email(@account[:username])
  site.my_vw.forgotten_password.send_email.click
end

When /^I click on the link to reset my password$/ do
  @email = site.vw_emails.get_last_email('Forgotten password')
  expect(@email).to_not be_nil
  STDOUT.puts site.vw_emails.get_email_token_link(@email)
  expect(site.vw_emails.get_email_token_link(@email)).to_not be_nil
end

And /^I navigate to the reset password page$/ do
  @token = get_email_token_link(@email)
  visit(reset_page_url+@token)
end

Then /^the Password and Repeat password fields should be displayed for me to fill in$/ do
  expect(site.my_vw.forgotten_password.new_password.present?).to eq(true)
  expect(site.my_vw.forgotten_password.confirm_password.present?).to eq(true)
end

Given /^I have started typing my (.*)/ do |password|
  site.my_vw.forgotten_password.visit_reset_page('/vw-authentication/forgotPassword/resetPassword?token=3974629f75f447b3a675768fbc047471')
  site.my_vw.forgotten_password.set_new_password(password)
  # site.my_vw.forgotten_password.reset_password.click
end

When /^I enter my password I should see what requirements has been fulfilled:$/ do |table|
   table.hashes.each do |hash|
    site.my_vw.forgotten_password.set_new_password(hash['password'])
    puts "For Password #{hash['password']}"
    array = Array.new
    array = hash.keys
     array.each do |req|
       case req
         when 'password'
           next
         else
           if hash[req] == 'not_active'
             puts "should be the following requirement not fullfiled:  #{req}"
             expect(site.my_vw.forgotten_password.active_requirements_list).not_to include (req)
           else
             expect(site.my_vw.forgotten_password.active_requirements_list).to include (req)
           end
       end
      end
    end
end

When /^I type in my new password (.*)$/ do |passw|
  expect(site.my_vw.forgotten_password.new_password.present?).to be true
  site.my_vw.forgotten_password.set_new_password_script(passw)
end

And /^I press reset password button$/ do
  Timeout.timeout(3) { sleep 1 unless site.my_vw.forgotten_password.reset_password.visible? }
  site.my_vw.forgotten_password.reset_password.click
end

Then /^I should get the error message (.*) displayed$/ do |error|
  expect(site.my_vw.forgotten_password.new_password_validation_error.text).to eq(error)
end

And /^I re-enter password that does not match (.*)$/ do |password|
  site.my_vw.forgotten_password.set_confirm_password(password)
end

Then /^I should not be able to submit the form and I should see message:$/ do |error|
  expect(site.my_vw.forgotten_password.confirm_password_validation_error.text).to eq(error)
end

But /^when I set re-entered password to (.*)$/ do |password|
  step "I re-enter password that does not match #{password}!"
end

Then /^I should be able successfully change my password$/ do
  step "I press reset password button"
end

And /^I the success message should be displayed:$/ do |message|
  expect(site.my_vw.login.login_error_message.text).to eq (message)
end

And /I should be able to login with new password/ do
  site.my_vw.login.set_email(@account[:username])
  site.my_vw.login.set_password('123Test5')
  expect(site.my_vw.login.account_navigation_bar.present?).to be true
#  Do I need to update json file in order to be able to update password for the same user?
end


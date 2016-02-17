
Given /^I have sent an email to change password to my address$/ do
  reset_token = site.my_vw.forgotten_password.get_reset_token(@account[:username])
  if reset_token.nil? || ((Time.now.to_i - reset_token['timestamp']) >= 86400)
    site.my_vw.forgotten_password.visit
    site.my_vw.forgotten_password.set_email(@account[:username])
    site.my_vw.forgotten_password.send_email.click
    sleep(10) # Wait for Email!
  end
end

When /^I click on the link to reset my password$/ do
  reset_token = site.my_vw.forgotten_password.get_reset_token(@account[:username])
  if reset_token.nil? || ((Time.now.to_i - reset_token['timestamp']) >= 86400)
    @email = site.vw_emails.get_last_email('Password Forgotten')
    @reset_link = site.vw_emails.get_email_token_link(@email)
    site.my_vw.forgotten_password.set_user_reset_link(@account[:username], @reset_link)
  else
    @reset_link = reset_token['reset_link']
  end
end

And /^I navigate to the reset password page$/ do
  site.my_vw.forgotten_password.browser_goto(@reset_link)
end

Then /^the Password and Repeat password fields should be displayed for me to fill in$/ do
  expect(site.my_vw.forgotten_password.new_password.present?).to eq(true)
  expect(site.my_vw.forgotten_password.confirm_password.present?).to eq(true)
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

When /^I type in my new password (.*)$/ do |password|
  site.my_vw.forgotten_password.set_new_password_script(password)
end

And /^I press reset password button$/ do
  Timeout.timeout(3) { sleep 1 unless site.my_vw.forgotten_password.reset_password.visible? }
  site.my_vw.forgotten_password.reset_password.click
end

Then /^I should get the error message (.*) displayed$/ do |error|
  expect(site.my_vw.forgotten_password.new_password_validation_error.text).to eq(error)
end

When /^I type in my new password$/ do
  timestamp = Time.now.to_i
  @password =  "Abcd!#{timestamp}"
  expect(site.my_vw.forgotten_password.new_password.present?).to be true
  site.my_vw.forgotten_password.set_new_password_script(@password)
end

And /^I re-enter password that does not match$/ do
  site.my_vw.forgotten_password.set_confirm_password("Password123")
end

Then /^I should not be able to submit the form and I should see message:$/ do |error|
  expect(site.my_vw.forgotten_password.confirm_password_validation_error.text).to eq(error)
end

But /^when I set re-entered password to match the password$/ do
  site.my_vw.forgotten_password.confirm_password.clear
  site.my_vw.forgotten_password.set_confirm_password(@password)
 end

Then /^I should be able successfully change my password$/ do
  step "I press reset password button"
end

And /^the success message should be displayed:$/ do |message|
  expect(site.my_vw.login.page_loaded?).to be true
  expect(site.my_vw.login.login_error_message.text).to eq (message)
end

And /I should be able to login with new password/ do
  site.my_vw.login.set_email(@account[:username])
  site.my_vw.login.set_password(@password)
  site.my_vw.login.do_login
  expect(site.my_vw.login.account_navigation_bar.present?).to be true
end

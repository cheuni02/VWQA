Given /^i am on the Volkswagen Account registration page$/ do
  site.my_vw.register.visit
end

Given /^i enter my name details as (.*) (.*) (.*)$/ do |title, first_name, surname|
  site.my_vw.register.title_select_list.set(title)
  site.my_vw.register.first_name_field.when_present.set(first_name)
  site.my_vw.register.surname_field.when_present.set(surname)
end

When /^i set the email account field to (.*)$/ do |email|
  site.my_vw.register.email_field.when_present.send_keys(email)
end

And /^i set the password field to (.*)$/ do |password|
  site.my_vw.register.password_field.when_present.set(password)
end

And /^i set the confirm password field to (.*)$/ do |repeat_password|
  site.my_vw.register.password_confirm_new.when_present.set(repeat_password)
end

Then /^i should not be able to complete my registration$/ do
  site.my_vw.register.submit_registration
  expect(site.my_vw.register.thank_you_page_present).to eq false
end

And /^i should see a message on the page stating (.*)$/ do |feedback|
  expect(site.my_vw.register.get_error_messages).to include(feedback)
end

When /^i submit my new account registration$/ do
  site.my_vw.register.registration_button.when_present.click
end

Then /^i should see error message on the page stating (.*)$/ do |feedback|
  expect(site.my_vw.register.email_taken_message).to include(feedback)
end

And /^i set my email to a random unused address$/ do
  step "i set the email account field to #{Time.now.to_i}test@example.com"
end

Then /^i should see the registration thank you page in my browser$/ do
  expect(site.my_vw.register.thank_you_page_present).to eq true
end

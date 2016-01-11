Given /^i am on the Volkswagen Account registration page$/ do
  site.my_vw.register.visit
end

Given /^i enter my name details as (.*) (.*) (.*)$/ do |title, first_name, surname |
  site.my_vw.register.title_select_list.select(title)
  site.my_vw.register.first_name_field.when_present.set(first_name)
  site.my_vw.register.surname_field.when_present.set(surname)
end

When /^i set the email account field to ((\'(.*)\'|(.*)))$/ do |email|
  site.my_vw.register.email_field.when_present.set(email)
end

And /^i enter a valid registration Password "(.*)"$/ do |password|
  site.my_vw.register.password_field.when_present.set(password)
  site.my_vw.register.password_confirm_new.when_present.set(password)
end

Then /^i should not be able to complete my registration$/ do
  expect(site.my_vw.register.registration_button.disabled?).to eq true
end

And /^i should see my a message on the page stating (.*)$/ do |feedback|
  expect(site.my_vw.register.registration_button.get_error_messages).to include(feedback)
end

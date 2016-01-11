Given /^i am on the Volkswagen Account registration page$/ do
  site.my_vw.register.visit
end

Given /^i enter my name details as (.*) (.*) (.*)$/ do |title, first_name, surname |
  site.my_vw.register

end
When i set the email account field to <email>
And i enter a valid registration Password "Abcd!2345"
Then i should not be able to complete my registration
And i should see my a message on the page stating <feedback>

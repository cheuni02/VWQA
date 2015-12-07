# Scenario Head

Given /^I am registering for a new VW account$/ do
  @registration = site.my_vw.register
  @registration.visit
end

# Negative - Missing fields

When /^I enter my first name as (.*) (.*) (.*)$/ do | title, firstname, lastname |
  @registration.set_title(title)
  @registration.set_first_name(firstname)
  @registration.set_surname(lastname)
end

And /^I set my email address to (.*)$/ do | email |
  tempemail = email.split('@')
  if tempemail.length > 0
    tempemail = tempemail[0] + "#{Time.now.to_i}" + "@" + tempemail[1]
  else
    tempemail = ""
  end
  @registration.set_email(tempemail)
end

And /^I enter a valid (.*)$/ do | password |
  @registration.set_password(password)
  @registration.set_password_confirm(password)
end

And /^I submit my registration$/ do
  @registration.submit_registration
end
    
Then /^I should find my account is not registered$/ do
  raise AssertionError, 'The registration succeeded instead of failing' unless @registration.get_validation.length > 0 || @registration.register_form.present?
end

# Negative - Invalid email addresses

Given /^I am registering for a new Volkswagen account$/ do
  step "I am registering for a new VW account"
end

When /^I enter the name as (.*) (.*) (.*)$/ do | title, firstname, lastname |
  step "I enter my first name as #{title} #{firstname} #{lastname}"
end
  
And /^I set email address to (.*)$/ do | email |
  @registration.set_email(email)
end

And /^I enter the valid (.*)$/ do | password |
  step "I enter a valid #{password}"
end

And /^I submit this for registration$/ do
  step "I submit my registration"
end
    
Then /^I should find my account has not been registered$/ do
  step "I should find my account is not registered"
end

# Negative - Invalid passwords

Given /^I am registering a new Volkswagen account$/ do
  step "I am registering for a new VW account"
end

When /^I enter their name as (.*) (.*) (.*)$/ do | title, firstname, lastname |
  step "I enter my first name as #{title} #{firstname} #{lastname}"
end

And /^I set their email address to (.*)$/ do | email |
  step "I set my email address to #{email}"
end
    
And /^I enter the (.*) and (.*)$/ do | password, passwordconfirm |
  @registration.set_password(password)
  @registration.set_password_confirm(passwordconfirm)
end

And /^I submit$/ do
  step "I submit my registration"
end

Then /^I should find that my account has not been registered$/ do
  step "I should find my account is not registered"
end

# Positive

Given /^that I am registering for a new VW account$/ do
  step "I am registering for a new VW account"
end

When /^I enter my name as (.*) (.*) (.*)$/ do | title, firstname, lastname |
  step "I enter my first name as #{title} #{firstname} #{lastname}"
end

And /^I set the email address to (.*)$/ do | email |    
  step "I set my email address to #{email}"
end

And /^I enter valid (.*) with confirmation$/ do | password |
  step "I enter a valid #{password}"
end

And /^I submit my registration form$/ do
  step "I submit my registration"
end

Then /^I should find that my account has been registered*/ do
  #raise "Test"
  raise unless site.my_vw.profile.page_loaded?
end

Given /^i view the form for subscribing to information about a given car model$/ do
  @keepMeInformed = site.new_cars.keep_informed
  @keepMeInformed.visit
end

Given /^i visit the Volkswagen homepage as a first time user$/ do
  site.homepage.visit
end
    
When /^i click on the navigation link to New Cars at the top of the page$/ do
  site.primary_nav.click_new_cars
end
    
And /^i choose the "(.*)" as the model i want to keep informed on$/ do |car_model|
  @keepMeInformed.select_model(car_model)
  @keepMeInformed.confirm_model
end

And /^i click the relevant link to subscribe to more information about the Polo$/ do
  @keepMeInformed.click_keep_informed_link
end
    
Then /^i should see the the car information subscription form loaded on the webpage$/ do
  raise unless @keepMeInformed.page_loaded?
end

When /^i enter a default information such as my title and email address$/ do
  @keepMeInformed.set_title("Mrs")
  @keepMeInformed.set_first_name("Testy")
  @keepMeInformed.set_surname("Tester")
  @keepMeInformed.set_email("test123@example.com")
end
    
And /^i submit the form using the button on the webpage$/ do
  @keepMeInformed.submit_form
end
    
Then /^i should see a thank you page has been loaded in my browser window$/ do
  raise unless @keepMeInformed.submission_complete?
end

When /^i enter my default personal information to the subscription form$/ do
  step "i enter a default information such as my title and email address"
end
    
And /^i complete the optional car details fields on the page$/ do
  @keepMeInformed.set_replacement_month("February")
  @keepMeInformed.set_replacement_year("2017")
  @keepMeInformed.set_replacement_private
  @keepMeInformed.set_replacement_new_car
  @keepMeInformed.set_car_make("Volkswagen")
  @keepMeInformed.set_car_model("E-Google")
end
    
And /^i submit my completed form again using the button on the page$/ do
  step "i submit the form using the button on the webpage"
end
    
Then /^i should see the thank you message appear in my browser window$/ do
  step "i should see a thank you page has been loaded in my browser window"
end

When /^i enter my personal details again using the form fields$/ do
  step "i enter a default information such as my title and email address"
end
    
And /^i check the box indicating i would like brochures sent to me for this car model$/ do
  @keepMeInformed.opt_in_post
end
    
And /^i enter my address details before clicking on the submit button on the page$/ do
  @keepMeInformed.set_house_number("999999")
  @keepMeInformed.set_postcode("UB6 7HA")
  @keepMeInformed.find_postcode
  
  step "i submit the form using the button on the webpage"
end
   
Then /^i should see the thank you submission result page in my browser window$/ do
  step "i should see a thank you page has been loaded in my browser window"
end



When /^i set my name as (.*) (.*) (.*) using the form fields$/ do |title, firstname, surname|
  @keepMeInformed.set_title(title)
  @keepMeInformed.set_first_name(firstname)
  @keepMeInformed.set_surname(surname)
end

And /^i provide my email address of (.*) into the relevant field$/ do |email|
  @keepMeInformed.set_email(email)
end
    
And /^i click on the submit button to send my form$/ do
  step "i submit the form using the button on the webpage"  
end

Then /^i should see the (.*) page appear in my browser$/ do |page|
  if page =~ /submission/i
    raise unless (@keepMeInformed.page_loaded?)
  else
    raise unless (@keepMeInformed.submission_complete?)
  end
end
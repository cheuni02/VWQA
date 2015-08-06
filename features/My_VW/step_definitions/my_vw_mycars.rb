# Positive - Has added cars to the account

Given /^I have navigated to the profile page$/ do
  @mycars = site.my_vw.profile
  @login = site.my_vw.login
  @addcar = site.my_vw.add_car
  @mycars.visit
end

And /^I have logged in correctly$/ do
  @login.set_email(@account[0])
  @login.set_password(@account[1])
  @login.do_login
  @mycars.add_car
  @addcar.add_car_default("FE06 KHO", "Test")
end

Then /^the profile page should be loaded$/ do
  raise unless @mycars.page_loaded?
end

And /^I can see the Book A Service link$/ do
  raise unless @mycars.book_service_button_present?
end

And /^the My Next Steps links should be displayed$/ do
  raise unless @mycars.check_next_steps_links.length > 0
end

And /^the Top Owners FAQs section should also be displayed$/ do
  raise unless @mycars.faq_present?
end

And /^there are 5 items in the FAQ section to click on$/ do
  raise unless @mycars.get_faq_links.length == 5
end

And /^I can see the How-To videos$/ do
  raise unless @mycars.how_to_videos_present?
end

# Positive - Book a service

Given /^I have logged in correctly on a user with added cars$/ do
  step "I have navigated to the profile page"
end

When /^I have clicked on the Book A Service link$/ do
  @mycars.book_service
end

Then /^I should be taken to the service booking functionality$/ do
  raise unless site.book_service.booking_step1.page_loaded?
end

# Positive - View FAQ items

Given /^I have navigated to the profile page with cars$/ do
  step "I have navigated to the profile page"
end

When /^I click on each FAQ item$/ do
  @faq = @mycars.get_faq_links
end

Then /^the FAQ item content should display$/ do
  @faq.each do |item|
    item.button.click
    raise if @mycars.get_faq_content.empty?
  end
end

Given /^that I have navigated to the profile page with cars$/ do
  step "I have navigated to the profile page"
end

When /^I click on the link to see more FAQ items$/ do
  @mycars.get_faq_supp_link.a.click
end

Then /^the need help page should appear$/ do
  raise unless site.need_help.wait_until_present_ask_question
end

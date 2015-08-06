Given(/^i am viewing fleet require a demo page on the website$/) do
  @fleetDemo = site.fleet.require_a_demo
  @fleetDemo.visit
end

Then(/^i should see all the required sections on the page$/) do
  raise unless @fleetDemo.demo_nav_section_present?
  raise unless @fleetDemo.demo_form_section_present?
end

When(/^i set my business details, company name as (.*) and job title as (.*)$/) do |companyName, jobTitle|
  @fleetDemo.set_company_name(companyName)
  @fleetDemo.set_job_title(jobTitle)
end


And(/^i set my personal details, name as (.*) (.*) (.*), email address as (.*) and telephone as (.*) into the relevant fields$/) do |title, firstName, surname, email, telephone|
  @fleetDemo.set_title_field(title)
  @fleetDemo.set_first_name(firstName)
  @fleetDemo.set_surname(surname)
  @fleetDemo.set_email(email)
  @fleetDemo.set_telephone(telephone)
end

And(/^i set information about fleet, fleet size as (.*), car as (.*), preferred date as (.*) and additional information as (.*)$/) do |fleetSize, car, preferredDate, additionalInfo|
  @fleetDemo.set_fleet_size(fleetSize)
  @fleetDemo.set_car_field(car)
  @fleetDemo.set_preferred_date(preferredDate)
  @fleetDemo.set_additional_info(additionalInfo)
end

And(/^i set the ways VW will contact me, such as (.*), (.*), (.*) or (.*)$/) do |emailPost, telephone, textMessage, post|
  @fleetDemo.set_email_information(emailPost)
  @fleetDemo.set_telephone_information(telephone)
  @fleetDemo.set_text_msg_info(textMessage)
  @fleetDemo.set_post_information(post)
end

And(/^i set if other organisations will contact me (.*)$/) do |otherOrganisations|
  @fleetDemo.set_not_hear_information(otherOrganisations)
end

And(/^i click on the Submit button to send my form$/) do
  @fleetDemo.click_submit_button
end

Then(/^i should see the (.*) page appear in my browser window$/) do |complete|
  @fleetDemo.demo_complete_status(complete)
end

When(/^i get the mouse over privacy policy link on request a demo page$/) do
  @fleetDemo.privacy_policy_mouse_hover
end

Then(/^i should see the privacy policy as popup on request a demo page$/) do
  raise "Privacy policy content is not visible" unless @fleetDemo.privacy_content_popup_present?
end

When(/^i submit the request a demo form having required fields empty$/) do
  @fleetDemo.click_submit_button
end

Then(/^i should be still on request a demo page$/) do
  @fleetDemo.demo_complete_status('Request Form')
end

And(/^i should see a validation message for each mandatory field$/) do
  @fleetDemo.company_name_error_msg_p?
  @fleetDemo.first_name_error_msg_p?
  @fleetDemo.surname_error_msg_p?
  @fleetDemo.email_error_msg_p?
  @fleetDemo.telephone_error_msg_p?
  @fleetDemo.job_title_error_msg_p?
end


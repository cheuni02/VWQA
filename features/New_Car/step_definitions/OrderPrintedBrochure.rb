Given(/^i am on Brochure and price list page of the following model "(.*)"$/) do |model|
  @printedBrochure = site.new_cars.order_printed_brochure
  @printedBrochure.visit(model)
  @brochureListPage = 'brochure list'
  @tellUsPage = 'tell us'
  @confirmationPage = "confirmation"
end

And(/^i go to Order a brochure page of the selected model$/) do
  @printedBrochure.order_brochure_car_model.click
  raise AssertionError, "The #{@brochureListPage} page has not been opened" unless @printedBrochure.page_loaded?(@brochureListPage)
end

When(/^i include (.*) the car brochure for the current selected model$/) do |current_model|
  @current_model = current_model
  @printedBrochure.add_current_brochure(@current_model)
end

And(/^i select brochures for other (.*) models on order a brochure page$/) do |brochures_number|
  @brochures_number = brochures_number
  @printedBrochure.another_brochures.click
  @printedBrochure.select_other_cars(@brochures_number)
end

And(/^i go to tell us about you page of ordering brochures$/) do
  @printedBrochure.next_button.click
  raise AssertionError, "The #{@tellUsPage} page has not been opened" unless @printedBrochure.page_loaded?(@tellUsPage)
end

Then(/^i should see the selected brochures of car models in the left side of the page$/) do
  raise AssertionError, 'The number of selected brochures is not the same as selected' unless @printedBrochure.selected_brochures.size == @brochures_number.to_i + @current_model.to_i
end

And(/^i should be able to select the "([^"]*)" title and fill in the personal details "([^"]*)" "([^"]*)"$/) do |title, first_name, last_name|
  @printedBrochure.select_title(title)
  @printedBrochure.first_name.set(first_name)
  @printedBrochure.last_name.set(last_name)
end

And(/^i should be able to fill in the contact details "([^"]*)" "([^"]*)"$/) do |email, telephone|
  @printedBrochure.email.set(email)
  @printedBrochure.telephone.set(telephone)
end

And(/^i should be able to fill my location details "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" and "([^"]*)"$/) do | house_name, postcode, street_name, street_name_second, town_city, county|
  @printedBrochure.house_name.set(house_name)
  @printedBrochure.postcode.set(postcode)
  @printedBrochure.street_name.set(street_name)
  @printedBrochure.street_name_second.set(street_name_second)
  @printedBrochure.town_city.set(town_city)
  @printedBrochure.county.set(county)
end

And(/^i should be able to tell about my next car as replacement date "([^"]*)" "([^"]*)", the condition "([^"]*)" and the ownership "([^"]*)"$/) do |month, year, condition, ownership|
  @printedBrochure.next_car_optional.click
  @printedBrochure.select_next_car_purchase_month(month)
  @printedBrochure.select_next_car_purchase_year(year)
  @printedBrochure.select_next_car_type(condition)
  @printedBrochure.select_next_car_ownership(ownership)
end

And(/^i should be able to tell about my current car as make "([^"]*)" and model "([^"]*)"$/) do |make, model|
  @printedBrochure.current_car_optional.click
  @printedBrochure.current_car_make.set(make)
  @printedBrochure.current_car_model.set(model)
end

And(/^i should be able to select how to be contacted by email "([^"]*)", telephone "([^"]*)", text message "([^"]*)" and post"([^"]*)"$/) do |email, telephone, message, post|
  @printedBrochure.contact_email(email)
  @printedBrochure.contact_telephone(telephone)
  @printedBrochure.contact_text_msg(message)
  @printedBrochure.contact_post(post)
end

And(/^i should be able to select if I don't want to hear from other organisations "([^"]*)"$/) do |other_organisations|
  @printedBrochure.contact_organisations(other_organisations)
end

And(/^i should see the privacy policy as a popup on the bottom of order a brochure page$/) do
  @printedBrochure.privacy_policy.when_present.hover
  raise AssertionError, 'The privacy policy content is not displayed' unless @printedBrochure.privacy_policy_content.present?
end

Then(/^i should be able to submit the request to order the brochures$/) do
  @selectedBrochures = @printedBrochure.get_brochures_names(@printedBrochure.selected_brochures)
  @printedBrochure.submit_button.click
end

And(/^i should be directed to the "([^"]*)" page$/) do |complete|
  case complete
    when @confirmationPage
      raise AssertionError, "The #{@confirmationPage} page has not been opened" unless @printedBrochure.page_loaded?(@confirmationPage)
      brochures_list1 = @printedBrochure.get_brochures_names(@printedBrochure.confirm_brochures)
      brochures_list2 = @printedBrochure.get_brochures_names(@printedBrochure.confirm_brochures_main)
      raise AssertionError, 'The list of brochures is not the same in confirmation page' unless (@selectedBrochures - brochures_list1).empty?
      raise AssertionError, 'The list of brochures is not the same in confirmation page' unless (brochures_list1 - brochures_list2).empty?
      raise AssertionError, 'Personal details section is not displayed on Confirmation page' unless @printedBrochure.confirm_personal_details.present?
      raise AssertionError, 'Print button is not displayed on Confirmation page' unless @printedBrochure.confirm_print_button.present?
      raise AssertionError, 'Home button is not displayed on Confirmation page' unless @printedBrochure.confirm_home_button.present?
      raise AssertionError, 'Book test drive link is not visible below confirmation section' unless @printedBrochure.book_test_drive_link.present?
      raise AssertionError, 'Create your account button is not displayed below confirmation section' unless @printedBrochure.create_account_button.present?
    when @tellUsPage
      raise AssertionError, "The #{@tellUsPage} page has not been opened" unless @printedBrochure.page_loaded?(@tellUsPage)
      raise AssertionError, 'Validation messages are not displayed' unless @printedBrochure.error_messages.present?
  end
end

When(/^i am on tell us about you page of ordering brochures$/) do
  step "i go to tell us about you page of ordering brochures"
end

And(/^i click on Back button from the bottom of the tell us about you page$/) do
  @printedBrochure.back_button_form.click
end

Then(/^i should be directed back to select the car models that i want brochures for$/) do
  raise AssertionError, "The #{@brochureListPage} page has not been opened" unless @printedBrochure.page_loaded?(@brochureListPage)
end

And(/^i click on Back button from select brochures page$/) do
  @printedBrochure.back_button_car_select.click
end

Then(/^i should be directed to order a brochure main page$/) do
  raise AssertionError, 'The Order a brochure page was not opened' unless site.new_cars.order_a_brochure.page_header.present?
end

When(/^i see the maximum other brochures i can select$/) do
  @n_of_brochures = @printedBrochure.get_number_of_other_brochures
end

And(/^i unselect the car brochure and price list of the chosen car model$/) do
  @printedBrochure.add_current_brochure('0')
end

Then(/^i should not be able to go to Tell us page$/i) do
  @printedBrochure.next_button.click
  raise AssertionError, "The #{@brochureListPage} page has is not displayed" unless @printedBrochure.page_loaded?(@brochureListPage)
end

And(/^i should see the maximum number of brochures to order is increased with one$/) do
  raise AssertionError, "The number of brochures to select was not increased by one" unless @printedBrochure.get_number_of_other_brochures == @n_of_brochures + 1
end

But(/^i select brochures for different models$/) do
  @printedBrochure.another_brochures.click
  @printedBrochure.select_other_cars(@printedBrochure.get_number_of_other_brochures)
end

Then(/^i should be able to land on Tell us page of Ordering a brochure$/i) do
  @printedBrochure.next_button.click
  raise AssertionError, "The #{@tellUsPage} page has not been opened" unless @printedBrochure.page_loaded?(@tellUsPage)
end

And(/^i see the image of the selected car model on top left of Ordering a brochure page$/) do
  @printedBrochure.selected_car_img.wait_until_present
  raise AssertionError, 'The image of the selected car model is not displayed' unless @printedBrochure.selected_car_img.loaded?
end

And(/^i see the description of the selected car model on top of the page$/) do
  raise AssertionError, 'The description of the selected car is not displayed' unless @printedBrochure.selected_car_description.present?
end

And(/^i expand the section with the other car models$/) do
  @printedBrochure.another_brochures.click
end

Then(/^i should see also the description, include checkbox and image of each car model on the page$/) do
  @printedBrochure.verify_new_cars_grid
end

But(/^i collapse the other car models section$/) do
  @printedBrochure.another_brochures.click
end

And(/^the car models should be hidden$/) do
  raise AssertionError, 'The car models grid has not been collapsed' if @printedBrochure.new_cars_section.present?
end
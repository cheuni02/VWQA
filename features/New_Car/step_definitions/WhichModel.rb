Given /^I have navigated to the which model page$/ do
  @carmodels = site.new_cars.car_models

  @carmodels.visit
end

Then /^the which model landing page has loaded successfully$/ do
  fail AssertionError, 'Unable to load page' unless @carmodels.page_loaded?
end

When /^I click on the image of (.*)$/ do |model|
  @carmodels.get_model('up-nf', model).click
end

Then /^it's showing the (.*) on the page$/ do |title|
  fail AssertionError, 'Wrong model' unless @carmodels.get_detail_title.include?(title.to_s)
  # raise AssertionError, "Wrong model - comparison table" unless @carmodels.get_comp_table_title.text.include?(title.to_s)
end

When /^I click on the "(.*)" section$/ do |section|
  @section = section
  @carmodels.click_table_section(section)
end

Then /^the section should open correctly$/ do
  fail AssertionError, 'Section not loaded' unless @carmodels.get_section(@section).present?
end

Given /^I have loaded the book a test drive feature$/ do
  @booktestdrive = site.book_test_drive

  site.homepage.visit
  site.primary_nav.book_test_drive  
end

And /^I have selected the "(.*)" model$/ do |model|
  @booktestdrive.select_car(model)
  #sleep(5)
end

Then /^step 2 should be loaded successfully$/ do
  raise AssertionError, "Step 2 not loaded" unless @booktestdrive.postcode_input_present?
end

When /^I enter a postcode (.*)$/ do |postcode|  
  @booktestdrive.set_postcode(postcode)
  @booktestdrive.retailer_search
end

Then /^a list of retailers should appear depending on if it's (.*)$/ do |result|
  if result == "fail"
    raise AssertionError, "Should show error text if invalid postcode" unless @booktestdrive.error_message_present?
  else
    raise AssertionError, "Retailers not being shown" unless @booktestdrive.get_retailers.present?
  end
end

When /^I enter the postcode "(.*)"$/ do |postcode|
  @booktestdrive.set_postcode(postcode)
  @booktestdrive.retailer_search
end

And /^I select the first retailer$/ do
  @booktestdrive.select_nearest_retailer
end

Then /^the 3rd step should be loaded$/ do
  raise AssertionError, "3rd step not loaded" unless @booktestdrive.step3_page_loaded?
end




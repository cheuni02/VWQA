Given /^that I have loaded step 3 of the process$/ do
  @booktestdrive = site.book_test_drive

  site.homepage.visit
  site.primary_nav.book_test_drive

  @booktestdrive.select_car("up!")
  @booktestdrive.set_postcode("W2 6AA")
  @booktestdrive.retailer_search
  @booktestdrive.select_nearest_retailer
end

Then /^step 3 should be loaded$/ do
  raise AssertionError, "Step 3 not loaded" unless @booktestdrive.step3_page_loaded?
end

And /^the number of days available should be "(.*)"$/ do |days|
  puts @booktestdrive.get_days.length
  raise AssertionError, "Incorrect number of days - expected #{days}" unless @booktestdrive.get_days.length == days.to_i
end

Given /^that I have got to step 3 of the process$/ do
  step "that I have loaded step 3 of the process"
end

When /^I click on a day$/ do
  @booktestdrive.select_day(@booktestdrive.get_days[rand(14)])
end

And /^I click on the button to proceed$/ do
  @booktestdrive.proceed
end

Then /^step 4 should be shown$/ do
  raise AssertionError, "Step 4 not loaded" unless @booktestdrive.step4_page_loaded?
end

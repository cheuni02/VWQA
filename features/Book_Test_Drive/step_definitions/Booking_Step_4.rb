Given /^that I have booked a day for the test$/ do
  @booktestdrive = site.book_test_drive

  site.homepage.visit
  site.primary_nav.book_test_drive

  @booktestdrive.select_car('up!')
  @booktestdrive.set_postcode('W2 6AA')
  @booktestdrive.retailer_search
  @booktestdrive.select_nearest_retailer
  @booktestdrive.select_day(@booktestdrive.get_days[rand(14)])
  @booktestdrive.proceed
end

Then /^step 4 should be loaded$/ do
  fail AssertionError, 'Step 4 not loaded' unless @booktestdrive.step4_page_loaded?
  @url = @booktestdrive.get_url.to_s
end

Given /^I have loaded the 4th step$/ do
  step 'that I have booked a day for the test'
end

And /^I've entered the (.*) and (.*)$/ do |firstname, lastname|
  @booktestdrive.step4_enter_firstname(firstname)
  @booktestdrive.step4_enter_lastname(lastname)
end

And /^I've given my (.*), (.*), (.*) and (.*)$/ do |housename, addressline1, town, postcode|
  @booktestdrive.step4_enter_housename(housename)
  @booktestdrive.step4_enter_addressline1(addressline1)
  @booktestdrive.step4_enter_town(town)
  @booktestdrive.step4_enter_postcode(postcode)
end

And /^I've added my (.*) and (.*)$/ do |emailaddress, phonenumber|
  @booktestdrive.step4_enter_email(emailaddress)
  @booktestdrive.step4_enter_phonenumber(phonenumber)
end

When /^I click on the submit button for the form$/ do
  @booktestdrive.submit_details
end

Then /^validation should appear for mandatory fields$/ do
  fail ValidationError unless @booktestdrive.get_validation.length > 0
end

Given /^that I have loaded the fourth step$/ do
  step 'I have loaded the 4th step'
end

When /^I have entered valid details$/ do
  @booktestdrive.step4_enter_firstname('Test')
  @booktestdrive.step4_enter_lastname('Tester')
  @booktestdrive.step4_enter_housename('1')
  @booktestdrive.step4_enter_addressline1('Fake Street')
  @booktestdrive.step4_enter_town('London')
  @booktestdrive.step4_enter_postcode('W2 6AA')
  @booktestdrive.step4_enter_email('test@test.com')
  @booktestdrive.step4_enter_phonenumber('01234567890')
end

And /^I submit the test drive booking$/ do
  step 'I click on the submit button for the form'
end

Then /^It should show confirmation of the test drive booking$/ do
  fail AssertionError, 'Confirmation not loading' unless @booktestdrive.confirmation_page_loaded?
end

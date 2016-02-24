Given /^i am visiting the Volkswagen homepage$/ do
  site.homepage.visit
end

When /^i click the top level link to book a test drive$/ do
  site.primary_nav.book_test_drive
end

Then /^i should see a page load that allows me to select the car i want to book$/ do
  fail unless site.book_test_drive.step_1_present?
end

Given /^i cancel any previous choices and start booking a test drive again$/ do
  site.book_test_drive.visit
end

When /^i select the car model named (.*)$/ do |model|
  site.book_test_drive.select_car(model)
end

Then /^i should see the postcode selector appear in my browser$/ do
  fail unless site.book_test_drive.postcode_input_present?
end

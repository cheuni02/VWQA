Given(/^the user is on the OSB first page$/) do
  site.homepage.visit
  @serviceBooking = site.book_service.booking_step1
  @serviceStep2 = site.book_service.booking_step2
  @serviceStep3 = site.book_service.booking_step3
  @serviceBooking.visit
end

And(/^has selected (an RTC|a non RTC) retailer: (.*)$/) do |type, retailer|
  @serviceBooking.set_retailer(retailer)
  @serviceBooking.retailer_to_autopopulate
  @serviceBooking.retailer_search
  @serviceBooking.click_next_step
end

Given(/^my car is on the affected cars list and i have entered the reg number (.*) on the stage 'Your Vehicle'$/) do |registration|
  @serviceStep2.set_registration(registration)
  @serviceStep2.submit_car_registration
  @serviceStep2.click_next_step
end

When(/^I get to the “Select work” step on the OSB and select any service$/) do
  @serviceStep3.select_random_work
end

Then(/^the emissions fix work should be available \(only if engine size ia (\d+)\.(\d+), (\d+)\.(\d+) or (\d+)\.0\), and opened by default$/) do |arg1, arg2, arg3, arg4, arg5|
  #pending
end

And(/^it should be pre\-selected by default$/) do
  #pending
end

But(/^I should be able to deselect it$/) do
  #pending
end

And(/^I should be able to select any other additional work for my car$/) do
  #pending
end

Given(/^I have selected 'Emissions fix' at '3\. Select work'$/) do
  #pending
end

When(/^I get to the Convenience options at '4 Select date'$/) do |arg|
  #pending
end

Then(/^all the convenience options should be free of charge$/) do
  #pending
end

Given(/^I am on the "([^"]*)" page$/) do |arg|
  #pending
end

When(/^I have provided my car reg number$/) do
  #pending
end

Then(/^3rd party experian should return car details engine incl\. engine (.*)$/) do |size|
  #pending
end

When(/^I match the engine size from experian with the ones configured on RCMS$/) do
  #pending
end

Then(/^the work code shown in RCMS diary should be (.*)$/) do |job|
  #pending
end

And(/^the engine fix time shown in RCMS diary should be (.*)$/) do |time|
  #pending
end
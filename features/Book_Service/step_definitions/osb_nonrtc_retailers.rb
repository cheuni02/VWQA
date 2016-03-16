Given(/^the user is on the OSB first page$/) do
  site.homepage.visit
  site.primary_nav.book_service
  @serviceBooking = site.book_service.booking_step1
  @serviceStep2 = site.book_service.booking_step2
  @serviceStep3 = site.book_service.booking_step3
  @serviceStep4 = site.book_service.booking_step4
end

And(/^has selected (an RTC|a non RTC) retailer: (.*)$/) do |type, retailer|
  Watir::Wait.until {@serviceBooking.retailer_textbox.present?}
  @serviceBooking.set_retailer(retailer)
  @serviceBooking.retailer_to_autopopulate
  @serviceBooking.retailer_search
  @serviceBooking.click_next_step
end

Given(/^my car is on the affected cars list and i have entered the reg number (.*) on the stage 'Your Vehicle'$/) do |registration|
  @serviceStep2.set_registration(registration)
  @serviceStep2.submit_car_registration
  @engine_size = @serviceStep2.jot_engine_size
  @serviceStep2.click_next_step
end

When(/^I get to the “Select work” step on the OSB$/) do
end

Then(/^the emissions fix work should be available \(only if engine size is (\d+)\.(\d+), (\d+)\.(\d+) or (\d+)\.(\d+)\), and opened by default$/) do |arg1, arg2, arg3, arg4, arg5, arg6|
   case @engine_size
    when '1.2', '1.6', '2.0'
      expect(@serviceStep3.emissions_fix_option).to be_present
    else
      expect(@serviceStep3.emissions_fix_option).not_to be_present
  end
end

And(/^it should be pre\-selected by default$/) do
  Watir::Wait.until {@serviceStep3.emissions_fix_option_checked.exists?}
  expect(@serviceStep3.emissions_fix_option_checked).to be_present
end

But(/^I should be able to deselect it$/) do
  tested_token = 0
  loop do
    @serviceStep3.emissions_fix_option.click
    if tested_token != 0
      break
    end
    if @serviceStep3.emissions_fix_option_checked.present?
      raise AssertionError, "checkbox should be unchecked at this stage"
      break
    end
    tested_token = 1
  end
end

And(/^I should be able to select any other additional work for my car$/) do
  @serviceStep3.select_random_work
end

Given(/^I have selected 'Emissions fix' at '3\. Select work'$/) do
  steps %(
    Given my car is on the affected cars list and i have entered the reg number KV14EOT on the stage 'Your Vehicle'
    When I get to the “Select work” step on the OSB
    Then the emissions fix work should be available (only if engine size is 1.2, 1.6 or 2.0), and opened by default
    And it should be pre-selected by default
         )
end

When(/^I get to the Convenience options at '4 Select date'$/) do
  @serviceStep3.click_next_step
end

Then(/^all the convenience options should be free of charge$/) do
  expect(@serviceStep4.options_free).to eq(true)
end

Given(/^I am on the "([^"]*)" page$/) do |arg|

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
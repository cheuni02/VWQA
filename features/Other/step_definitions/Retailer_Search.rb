Given /^i visit the correct webpage for searching for VW Dealers in my local area$/ do
  @retailerSearch = site.special_pages.retailer_search
  @retailerSearch.visit
end

Given /^i am on the VW Homepage of the website$/ do
  site.homepage.visit
end

When /^i click on the top level nav button to Find Retailers$/ do
  site.primary_nav.retailer_search
end

Then /^i should see the Retailer search page load correctly in my browser$/ do
  raise unless @retailerSearch.page_loaded?
end

When /^i search for my current location of (.*) using the retailer location search$/ do |retailer|
  @retailer = retailer
  @retailerSearch.retailer_location_search(@retailer)
end

Then /^i should see the first retailer name of (.*) shown in a list of retailers$/ do |expected|
  result = @retailerSearch.get_first_result_title if expected !~ /error/i
  result = nil if expected =~ /error/i

  if result.nil?
    raise unless @retailerSearch.search_error_present?
  else
    result = result.split('(')
    expected = expected.split('(')


    raise unless result[0] =~ /#{expected[0]}/i
    if result.length > 1
      result[1].gsub!(')', '')
      expected[1].gsub!(')', '')
      raise unless result[1] =~ /#{expected[1]}/i
    end
  end
end

When /^i search for a retailer that i know named (.*)$/ do |retailer_name|
  @retailerSearch.retailer_name_search(retailer_name)
end

Then /^i should see the retailer information is shown in my web browser$/ do
  raise unless site.retailer_pages.retailer_homepage_loaded?
end

When /^i search for a retailer in my local area of "(.*)"$/ do |location|
  step "i search for my current location of #{location} using the retailer location search"
end

And /^i click on the tab link to view results on a map$/ do
  @retailerSearch.set_map_view
end

Then /^i should see a map image displayed with pins representing my local retailers$/ do
  @retailerSearch.retailer_map_present?
end

When /^i search again for a retailer in the "(.*)" Area$/ do |location|
  step "i search for my current location of #{location} using the retailer location search"
end

And /^i want to book a test drive with the closest retailer to me$/ do
  @retailerSearch.click_first_test_drive
end

Then /^i should see the book a test drive page load in my browser$/ do
  @testdrive = site.book_test_drive
  raise unless @testdrive.step_1_present?
end

And /^i should also see the second step information has been filled in with my chosen retailer$/ do
  raise unless @testdrive.step2_info_present?
end

When /^i search for Volkswagen retailers near "(.*)"$/ do |location|
  step "i search for my current location of #{location} using the retailer location search"
end

And /^i decide to book a service for my volkswagen car$/ do
  @retailerSearch.click_first_book_service
end

Then /^i should be taken to the second step of booking a service as my retailer information is already complete$/ do
  raise unless site.book_service.booking_step2.page_loaded?
end

When /^i search for a local retailer near "(.*)"$/ do |location|
  step "i search for my current location of #{location} using the retailer location search"
end

And /^i view the latest offers for the first retailer in the results list$/ do
  @retailerSearch.click_first_retailer_offers
end

Then /^i should see a page containing a list of relevant offers from my local retailer$/ do
  raise unless site.retailer_pages.retailer_offers_loaded?
end

When /^i select the button at the bottom of the page to view the Volkswagen Service Promise$/ do
  @retailerSearch.click_service_promise
end

Then /^the service promise webpage should load inside my browser$/ do
  raise unless site.owners.servicing.service_promise.page_loaded?
end

When /^i click the page button to track my current Volkswagen car order$/ do
  @retailerSearch.click_order_status
end

Then /^i should be taken to a webpage where i can enter my Volkswagen order number$/ do
  raise unless site.owners.orders_status.page_loaded?
end

When /^i click on the page link to book a test drive with Volkswagen$/ do
  @retailerSearch.click_book_test_drive
end

Then /^the first step of booking a test drive should appear in my browser$/ do
  raise unless site.book_test_drive.step_1_present?
end

When /^i click the button on the page to book a service without performing a retailer search$/ do
  @retailerSearch.click_book_service
end

Then /^i should be taken to the start of the service booking process$/ do
 raise unless site.book_service.booking_step1.page_loaded?
end

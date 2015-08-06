Given /^that I have loaded MPV$/ do
  @mpv = site.mpv
  @shortlist = @mpv.shortlist
  @details = @mpv.details
end

And /^I enter the shortlist$/ do
  @shortlist.visit_default
end

Then /^the page should load correctly$/ do
  @shortlist.wait_until_page_loaded
end

When /^I click on the More matches button at the bottom of the page$/ do
  @shortlist.show_more_matches
end

Then /^more options should appear$/ do
  raise ElementNotPresentError unless @shortlist.more_matches_present?
  raise AssertionError, "No matches present" unless @shortlist.get_more_matches.length > 0
end

When /^I click on the cars$/ do
  @car = @shortlist.get_shortlisted_cars[0]
  @car_name = @shortlist.get_name(@car)
  @shortlist.open_details_page(@car)
end

Then /^I should see the correct details page$/ do
  @details.wait_until_page_loaded
  raise AssertionError, "Car name does not match what's expected" unless @details.check_car_name(@car_name)
end

#   *** Disabled this feature (01/04/2015)
#
#   1) Please improve Explore.feature - the feature file is supposed to describe the functionality that you are testing in a format that anyone can read it and understand what's going on.
#   This feature file is too sparse and hard to follow what is happening.
#
#

Given /^I'm loading the explore page for the up-nf model$/ do
  @explore = site.new_cars.explore_page
  @explore.visit
end

Then /^explore page should load correctly$/ do
  fail AssertionError, 'Unable to load page' unless @explore.page_loaded?
end

When /^the 360 view button is pressed$/ do
  @explore.click_360_view
end

Then /^the image should change into the 360 degree model$/ do
  fail AssertionError, '360 view not loading correctly' unless @explore.get_360_images.length > 0
  fail AssertionError, '360 view not loading correctly' unless @explore.get_360_arrow.present?
end

When /^I want to view the interior gallery$/ do
  @explore.click_gallery_interior
end

Then /^it should take me to slide "(.*)"$/ do |slide|
  fail AssertionError, 'not navigating to interior gallery' unless @explore.get_current_slide('interior').text == slide
end

Then /^there should be "(.*)" slides$/ do |slides|
  fail AssertionError, 'not showing slides correctly' unless @explore.get_slides('interior').length == slides.to_i
end

When /^I view the stylish gallery$/ do
  @explore.click_gallery_stylish
end

Then /^I'll load slide "(.*)"$/ do |slide|
  fail AssertionError, 'not navigating to stylish gallery' unless @explore.get_current_slide('stylish').text == slide
end

Then /^there'll be "(.*)" slides$/ do |slides|
  fail AssertionError, 'not showing slides correctly' unless @explore.get_slides('stylish').length == slides.to_i
end

When /^I wish to view the driving gallery$/ do
  @explore.click_gallery_driving
end

Then /^I'll load slide "(.*)" which is the last$/ do |slide|
  fail AssertionError, 'not navigating to driving gallery' unless @explore.get_current_slide('driving').text == slide
end

Then /^there will be "(.*)" slides$/ do |slides|
  fail AssertionError, 'not showing slides correctly' unless @explore.get_slides('driving').length == slides.to_i
end

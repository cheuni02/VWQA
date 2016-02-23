Given /^i am on the Volkswagen homepage in my browser$/ do
  @homepage = site.homepage
  @homepage.visit
end

When /^i click on the main link displayed on the homepage with text (.*)$/ do |text|
  @homepage.click_homepage_link(text)
end

Then /^i should see the correct (.*) page load in my browser window$/ do |page|
  case page
  when /New Cars/i
    site.new_cars.wait_for_range_load
    fail unless site.new_cars.page_loaded?
  when /Used Cars/i
    fail unless site.used_cars.page_loaded?
  when /Owners/i
    fail unless site.owners.page_loaded?
  end
end

When /^i click on the carousel item at the index (\d)$/ do |index|
  step 'i am on the Volkswagen homepage in my browser'
  @index = index.to_i
  @homepage.click_carousel_index(@index)
end

Then /^i should see a carousel header and text displayed on the homepage$/ do
  expect { @homepage.carousel_header_present?(@index) }.to_not raise_error
end

When /^i go to the VW UK Website in my web browser$/ do
  step 'i am on the Volkswagen homepage in my browser'
end

Then /^i should see the VW Logo appear on the homepage indicating it has loaded correctly$/ do
  fail unless @homepage.vw_logo_present?
end

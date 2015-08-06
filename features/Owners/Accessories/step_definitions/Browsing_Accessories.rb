Given /^i have visited the Volkswagen homepage on the website$/ do
  site.homepage.visit
end

When /^i go to the Owners section of the site as detailed on the top level navigation$/ do
  site.primary_nav.click_owners
end

And /^i select the option that allows me to browse all availible accessories$/ do
  #site.owners.click_link("accessories")
  site.owners.click_accessory_link
end

Then /^i should see a page containing options for accessories or mechandise$/ do
  raise unless site.owners.accessories.main_loaded?
end

And /^if i then choose the option to view all accessories$/ do
  site.owners.accessories.view_all_accessories
end

Then /^i should see a page that contains a range of accessories and options to filter what i am looking for$/ do
  raise unless site.owners.accessories.filter_options_present?
end

Given /^i want to search for a specific accessory$/ do
  site.owners.accessories.visit_search
  #site.owners.accessories.view_all_accessories
end

When /^i enter a keyword of (.*) into the search by keyword box on the webpage$/ do |query|
  @search = query
  site.owners.accessories.find_accessory(@search)
end

Then /^i should see a series of results that are relevant to my search terms$/ do
  results = site.owners.accessories.get_search_results
  raise unless results.length > 0
end

Given /^i clear all of the filters i previously applied to the page$/ do
  step "i want to search for a specific accessory"
end

When /^i select a select my valid car model of (.*)$/ do |model|
  site.owners.accessories.set_filter_model(model)
end

And /^i select (\d+\s-\s\d+|all) Which represents the year the car i want to find accessories for$/i do |year|
  site.owners.accessories.set_filter_year(year)
  site.owners.accessories.filter_search
end

Then /^i should see that results are present in my browser$/ do
  step "i should see a series of results that are relevant to my search terms"
end

Given /^i ensure i have no active filters on the accessories search page$/ do
  step "i want to search for a specific accessory"
end

When /^i select a category named (.*) from the dropdown panel on the page$/ do |category|
  site.owners.accessories.set_filter_category(category)
end

Then /^i should see accessory search results are present in my browser$/ do
  step "i should see a series of results that are relevant to my search terms"
end

When /^i enter my location as "(.*)" in the Search for retailers box on the accessories page$/ do |location|
  step "i want to search for a specific accessory"
  site.owners.accessories.set_location(location)
  site.owners.accessories.search_location
end

Then /^i should see a panel appear containing a list of retailers that are near my location$/ do
  raise unless site.owners.accessories.retailer_panel_present?
end

Given /^i reset any previous filters i have applied to the page$/ do
  step "i want to search for a specific accessory"
end

When /^i select the first product from the entire list of accessories on the page$/ do
  site.owners.accessories.click_first_accessory
end

Then /^i should see some more information about the product including its price and description$/ do
  title = site.owners.accessories.accessory_title_present?
  image = site.owners.accessories.accessory_image_present?
  desc = site.owners.accessories.accessory_desc_present?
  raise if ((title || image || desc) == false)
end

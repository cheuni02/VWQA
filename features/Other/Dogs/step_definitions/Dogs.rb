Given /^i have gone back to the Volkswagen Homepage$/ do
  site.homepage.visit
end
 
When /^i go to the special Volkswagen Dogs landing page$/ do
  site.special_pages.dogs.visit
end

Then /^i should see that the page loads correctly in my browser$/ do
  site.special_pages.dogs.page_loaded?
end

When /^i click on the button to change view to cars$/ do
  site.special_pages.dogs.set_view_cars
end
    
Then /^i should see all of the dog images replaced by their car counterparts$/ do
  items = site.special_pages.dogs.get_range_content
  errors = items.select { |item| item[2] == false}
  raise unless errors.length == 0
end

But /^if i revert the view back to dogs again$/ do
  site.special_pages.dogs.set_view_dogs
end

Then /^i should see the images return to the previous state$/ do
  step "i should see all of the dog images replaced by their car counterparts"
end

When /^i change the filter to (.*) using the dropdown box$/ do |filter|
  site.special_pages.dogs.set_dog_filter(filter)  
end

Then /^i should see the first item on the page is still present$/ do 
  step "i should see that the page loads correctly in my browser"
end

Given /^i reload the page to reset any changes i have made$/ do
  step "i go to the special Volkswagen Dogs landing page"
end

When /^i select the first item in the list of dogs$/ do
  site.special_pages.dogs.select_first_dog
end

Then /^i should see links to view more information and sign up for Volkswagen News$/ do
  more_info = site.special_pages.dogs.more_info_link_present?
  vw_news = site.special_pages.dogs.vw_news_link_present?
  raise if ((more_info || vw_news) == false)
end




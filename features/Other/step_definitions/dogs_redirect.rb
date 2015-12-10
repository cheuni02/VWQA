When /^i go to the old dogs page through the URL in my browser$/ do
  site.special_pages.dogs.visit
end

Then /^i should be redirected back to the new car range page$/ do
  expect(site.new_cars.page_loaded?).to be true
end

Given (/^I am on the Volkswagen Homepage$/) do
  site.homepage.visit
end

When (/^I click the book a service button in navigation$/) do
  site.primary_nav.book_service
end

When (/^I go to add a new car$/) do
  site.my_vw.add_current_car.visit
end
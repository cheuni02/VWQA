Given(/^i am visiting Order a brochure page on the site$/i) do
  @orderBrochure = site.new_cars.order_a_brochure
  @orderBrochure.visit
  fail AssertionError, 'The Order a brochure page was not opened' unless @orderBrochure.page_loaded?
end

When(/^i see the page header and small description$/) do
  fail AssertionError, 'Page title is not displayed on the page' unless @orderBrochure.page_header.present?
  fail AssertionError, 'Page description is not displayed on the page' unless @orderBrochure.page_description.present?
end

And(/^i see the Older model brochures button$/i) do
  fail AssertionError, 'Older model brochures button is not displayed on the page' unless @orderBrochure.older_model_brochures_button.present?
end

Then(/^i see the car models displayed as grid$/i) do
  fail AssertionError, 'Car models grid is not displayed on the page' unless @orderBrochure.car_models_grid.present?
end

When(/^i get the mouse over the car models i should see a popup with the name of the car, list of downloads and links to order a printed brochure and view the car$/) do
  @orderBrochure.car_models_grid.wait_until_present
  cars = @orderBrochure.car_models.size
  3.times do
    select_car = @orderBrochure.car_models[rand(cars.to_i - 1)]
    car_name = @orderBrochure.car_model_name(select_car).text
    fail AssertionError, "The name of the car model #{car_name} is not displayed" unless @orderBrochure.car_model_name(select_car).present?
    select_car.hover
    @orderBrochure.brochure_menu.wait_until_present
    fail AssertionError, 'The name of the car is not displayed on brochure menu' unless @orderBrochure.brochure_menu_car_name.present?
    fail AssertionError, 'The name of the car is different on brochure menu than on car grid' unless @orderBrochure.brochure_menu_car_name.text.eql? car_name
    fail AssertionError, 'There are no brochures to download' if @orderBrochure.brochure_menu_downloads.size == 0
    fail AssertionError, 'The link to Order printed brochure is not displayed' unless @orderBrochure.brochure_menu_order_printed.present?
    fail AssertionError, 'The View car button is not displayed on the page' unless @orderBrochure.brochure_menu_view_car.present?
  end
end

When(/^i select a car model from car models grid$/) do
  @orderBrochure.car_models_grid.wait_until_present
  cars = @orderBrochure.car_models.size
  @orderBrochure.car_models[rand(cars.to_i - 1)].hover
end

And(/^i click on Order printed brochures link from brochures menu$/) do
  @orderBrochure.brochure_menu.wait_until_present
  @orderBrochure.brochure_menu_order_printed.click
end

Then(/^i should be directed to Order a printed brochure starting page of the selected model$/i) do
  fail AssertionError, 'The brochures list page has not been opened' unless site.new_cars.order_printed_brochure.page_loaded?('brochure list')
end

When(/^i select a car model to view from car models grid$/) do
  step 'i select a car model from car models grid'
end

And(/^i click on View car button from brochures menu$/) do
  @orderBrochure.brochure_menu.wait_until_present
  @orderBrochure.brochure_menu_view_car.click
end

Then(/^i should be directed to Car Overview page of the selected car model$/) do
  fail AssertionError, 'The Car overview page was not opened' unless site.new_cars.mlp_loaded?
end

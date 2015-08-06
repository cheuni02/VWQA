=begin
  ***Disabled this feature as there's issues:

  1) Why are we testing every single table column behind every single engine on 5 model pages? Theres no value to test this much on automation and its going to slow everything down
  Please make this run for one engine only - if it works for 1 engine across 5 models that should be satisfactory acceptance criteria!
  2) The method verify_details_table(engine) is too long and too verbose, please cut this down to be similar number of lines as other methods. Take a look at how some of the other
  Ruby methods are aligned to get an idea of how to break this down into a more manageable bitesize chunks
  3) Theres no tests against the table data in here - we should include a quick data sanity check in here. We cant just test the table columns open and close!
  4) What about testing if the engine images are present? Are the correct number of engines displayed for a given model? Use a scenario outline to set this up
=end





Given(/^i am viewing the engines and performance page for the model (.*)$/) do |model|
  @enginePerformance = site.new_cars.engines_performance
  @enginePerformance.visit(model)
  @enginePerformance.page_loaded?
end

When(/^i see the list of engines from the horizontal scroll view$/) do
  @enginePerformance.engines_models_section_p?
end

Then(/^i should be able to select and view the details in the table for each engine$/) do
  @enginePerformance.select_engines
end

Given(/^i am on new car range page$/) do
  site.new_cars.visit
  @enginePerformance = site.new_cars.engines_performance
end

When(/^i select the "(.*)" car model that I want$/) do |model|
  @model = model
  site.new_cars.select_model(@model)
  site.new_cars.confirm_model
end

And(/^i select engine and performance link from mlp navigation$/) do
  #site.new_cars.mlp_nav.select_primary_item('Car models', 'Engines & performance')
  @enginePerformance.visit(@model)
end

Then(/^i should land on engines and performance page$/) do
  raise unless site.new_cars.engines_performance.page_loaded?
end

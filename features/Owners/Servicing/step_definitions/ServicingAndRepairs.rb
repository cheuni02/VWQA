#!/bin/env ruby
# encoding: utf-8

Given /^that I have loaded the Servicing page$/ do
  @sar = site.owners.servicing
  @bookservice1 = site.book_service.booking_step1
  @service_promise = site.owners.servicing.service_promise
  @service_plan = site.owners.servicing.service_plan
  @parts_guarantee = site.owners.servicing.parts_guarantee
  @body_repair = site.owners.servicing.body_repair
  @express_fit = site.owners.servicing.express_fit
  @what_we_check = site.owners.servicing.what_we_check
  @winter_check = site.owners.servicing.winter_check
  @sar.visit
end

Then /^the page should be displayed correctly with links$/ do
  
  raise AssertionError, "Page not loaded" unless @sar.page_loaded?
end

When /^I click on a servicing (.*)$/ do |option|
  @sar.click_link(option)
end

Then /^I should load the relevant page with the correct (.*)$/ do |title|  
  case(title.to_s)
    when "Book a service"      
      raise AssertionError, "#{title} not loading" unless @bookservice1.page_loaded?      
      raise AssertionError, "Something else has been loaded" unless @bookservice1.get_title.to_s.include?(title.to_s)
    when 'Volkswagen Service Promise'
      raise AssertionError, "#{title} not loading" unless @service_promise.page_loaded?  
    when 'Volkswagen Service Plans'
      raise AssertionError, "#{title} not loading" unless @service_plan.page_loaded?
    when 'Parts'
      raise AssertionError, "#{title} not loading" unless @parts_guarantee.page_loaded?
    when 'Body Repair'
      raise AssertionError, "#{title} not loading" unless @body_repair.page_loaded?
    when 'Express Fit'
      raise AssertionError, "#{title} not loading" unless @express_fit.page_loaded?
    when 'What We Check And Why'
      raise AssertionError, "#{title} not loading" unless @what_we_check.page_loaded?
    when 'Winter Check £20'
      raise AssertionError, "#{title} not loading" unless @winter_check.page_loaded?
    else raise
  end
  
  unless title == 'Book a service'
    raise AssertionError, "Something else has been loaded" unless @sar.get_title.to_s.include?(title.to_s)
  end
end

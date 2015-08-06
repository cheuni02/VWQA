#!/bin/env ruby
# encoding: utf-8

Given /^i visit the webpage for viewing information about small business leasing$/ do
  @smallBusiness = site.finance_offers.small_business_leasing
  @smallBusiness.visit
end
    
When /^i select the car model (.*) from the list of models i can view quotes for$/ do |model|
  @smallBusiness.view_car_quotations(model)
end

Then /^i should see a panel containing a table of car trims engines and monthly cost$/ do
  @smallBusiness.quotation_panel_present?
end
    
But /^if there are multiple pages in the panel and i click through them$/ do
  @errors = @smallBusiness.check_quotation_data
end
    

Then /^i should see the correct data is displayed for all items inside that model$/ do
  raise "#{@errors.inspect}" unless @errors.length == 0
end

When /^i select the car model (.*) from the list of unfiltered models$/ do |model|
  step "i select the car model #{model} from the list of models i can view quotes for"
end

And /^i note the number of model trims that should be displayed inside the panel$/ do
  @titleCount = @smallBusiness.get_title_count  
end

    
And /^i count the number of table rows presented on each page of the panel$/ do
  @rowCount = @smallBusiness.count_table_rows
end
    
Then /^i should find that the number of table rows matches the count displayed in the panel header$/ do
  raise "#{@titleCount} - #{@rowCount}" unless @titleCount.to_i == @rowCount.to_i
end


When /^i select one of the car models from the list on the page$/ do
  @smallBusiness.view_car_quotations("Golf")
end
      
And /^i click on one of the availible view Quote links inside the data table$/ do
  @smallBusiness.click_random_view_quote
end
      
Then /^i should find the finance cacluator load in my browser window$/ do
  @financeCalc = site.finance_offers.finance_calculator
  @financeCalc.wait_for_table_load
  raise unless @financeCalc.main_page_loaded?
end
      
And /^i should see the type of finance is automatically set to Business$/ do
  raise unless @financeCalc.business_table_present?
end
      
But /^i also should not see any nonsense values in the calculator table$/ do
  data_values = @financeCalc.get_table_data
  data_values.each do |value|
    value.gsub!(/(\£|p|\,)/i, "")
  end
  
  #STDOUT.puts data_values.inspect
  raise if (data_values[0].to_f <= 0.0 || data_values[0].to_f > 2500.0)
  raise if (data_values[1].to_f <= 0.0 || data_values[1].to_f > 250000.0)
  raise if (data_values[2].to_f <= 0.0 || data_values[2].to_f > 10000.0)
  raise if (data_values[3].to_i <= 0   || data_values[3].to_i > 48)
  raise if (data_values[4].to_i <= 0   || data_values[4].to_i > 60000)
  raise if (data_values[5].to_f <= 0.0 || data_values[5].to_f > 100.0)
end

Given /^I navigate to the Basics page$/ do
  @mpv = site.mpv
  @basics = @mpv.basics 
  @mpv.visit
  @mpv.wait_to_start
  @mpv.click_start_button 
  @basics.visit_basics
end

Then /^the number of menu items should be "(.*)"$/ do |itemcount|
  raise PageNotLoadedError unless @basics.basics_page_loaded?  
  raise AssertionError, "Unexpected number of items" unless @basics.item_list.length == itemcount.to_i
end

When /^I have clicked on the (.*) section$/ do |section|
  @section = section
  @basics.open_section(section)
end
   
Then /^there should be (.*) options available$/ do |options|
  footer = @basics.get_footer(@section).length  
  if @section == "price"
    raise AssertionError, "Unexpected number of options" unless @basics.get_section_options(@section).length == options.to_i
  else
    raise AssertionError, "Unexpected number of options" unless @basics.get_section_options(@section).length - footer == options.to_i
  end
end

When /^I open the (.*) panel$/ do |section|
  @basics.open_section(section)
end

And /^click all (.*) (.*) options that are available$/ do |section, no_options|
  @options = @basics.get_section_options(section)
  @options.each do |option|
    if option.visible?
      option.click
    end
  end
end

Then /^only (.*) (.*) options remain selected$/ do |result, section|
  @selected = @basics.get_selected_items(section)
  raise AssertionError, "Wrong no of selected items" unless @selected.length == result.to_i
end

When /^I select (.*) and (.*) from (.*)$/ do |option1, option2, section|
  @basics.open_section(section)
  @basics.select_options(section, option1, option2)
end

And /^click Close$/ do
  @basics.click_close
end

Then /^the (.*) and (.*) are displayed in the summary$/ do |option1, option2|
  raise AssertionError, "Option not present in summary" unless @basics.summary_option_present?(option1)
  raise AssertionError, "Option not present in summary" unless @basics.summary_option_present?(option2)
end

When /^I click on the (.*) panel$/ do |section|
  @basics.open_section(section)
end

And /^click I dont mind$/ do
  @basics.click_dont_mind
  sleep(3)
end

Then /^I am taken to the (.*) section$/ do |next_section|
  raise AssertionError, "Unexpected next section" unless @basics.current_section == next_section
end

And /^no option is selected for (.*)$/ do |section|
  raise AssertionError, "Options selected for section" unless !@basics.section_expanded?(section)
end


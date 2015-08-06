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

When /^I open the Body style panel$/ do
  @basics.open_section("bodystyle")
end

And /^click all 6 options that are available$/ do
  @options = @basics.get_section_options("bodystyle")
  @options.each do |option|
    if option.visible?
      option.click
    end
  end
end

Then /^only 3 options remain selected$/ do
  @selected = @basics.get_selected_items("bodystyle")
  raise AssertionError, "Wrong no of selected items" unless @selected.length == 3
end


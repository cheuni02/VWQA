Given /^I have loaded the What We Check and Why page$/ do
  @wecaw = site.owners.servicing.what_we_check
  @express_visual = site.owners.servicing.express_visual_check
  @areas_we_check = site.owners.servicing.areas_we_cover

  @wecaw.visit
end

Then /^the page in question should be loaded$/ do
  raise AssertionError, "Page not loaded correctly" unless @wecaw.page_loaded?
end

Then /^(.*) (.*) should be displayed$/ do |title, index|  
  raise AssertionError, "Incorrect title - should be #{title}" unless @wecaw.get_section_title(index).include?(title)
end

When /^I click on the link for (.*)$/ do |index|
  @index = index
  @wecaw.click_button(index)
end

Then /^relevant page with (.*) should appear$/ do |title|
  case(@index.to_i)
    when 0
      raise AssertionError, "Page not loaded" unless @express_visual.page_loaded?
      raise AssertionError, "Wrong title - #{title} is expected" unless @express_visual.get_title.include?(title)
    when 1
      raise AssertionError, "Page not loaded" unless @areas_we_check.page_loaded?
      raise AssertionError, "Wrong title - #{title} is expected" unless @areas_we_check.get_title.include?(title)
    when 4
      raise AssertionError, "Page not loaded" unless @wecaw.page_loaded_mot?      
      raise AssertionError, "Wrong section" unless @wecaw.get_url.include?('#details')
    else raise
  end
end


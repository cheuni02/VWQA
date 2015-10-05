Given /^i visit the VW.co.uk homepage in my browser$/ do
  site.homepage.visit
  @siteSearch = site.special_pages.site_search
  @news = site.about_us.news
end

When /^i search for "(.*)" using the search box on the page$/ do |text|
  @siteSearch.submit_query(text)
end

Then /^i should see a list of results displayed in my browser$/ do
  raise ElementNotPresentError, "Could not find retailer tab in search results" unless @siteSearch.retailers_tab_present?
  raise ElementNotPresentError, "Could not find accessory tab in search results" unless @siteSearch.accessory_tab_present?
  raise ElementNotPresentError, "Could not find pages tab in search results" unless @siteSearch.pages_tab_present?
  raise ElementNotPresentError, "Could not find news tab in search results" unless @siteSearch.news_tab_present?
end

When /^i search for the car model called (.*) in the search box$/ do |query|
  step "i search for \"#{query}\" using the search box on the page"
  @query = query
end

Then /^i should see a panel containing the name of the car i searched for$/ do
  car_details = @siteSearch.get_first_car_header
  #STDOUT.puts car_details
  raise unless car_details =~ /#{@query}/i
end

And /^there should be an image along with links to view more information and configure$/ do
  raise ElementNotPresentError, "Element for main car related image in search results not found" unless @siteSearch.first_car_image_present?
  raise ElementNotPresentError, "Element for main car information could not be found" unless @siteSearch.first_car_info_present?
  raise ElementNotPresentError, "Element for main car configure link could not be found" unless @siteSearch.first_car_configure_present?
end

And /^i should see the relevant facets$/ do
  raise ElementNotPresentError, "Facets are not showing" unless @siteSearch.check_facets_present
end

When /^i enter a search query of "(.*)" into the search box$/ do |query|
  @siteSearch.submit_query(query)
end

Then /^i should find a link is present to the correct content$/ do
  raise ElementNotPresentError, "Unable to find link to URL '/owners/manual'" unless @siteSearch.find_link("/owners/manuals")
end

When /^i go to the news page and copy the latest news heading$/ do
  @news.visit
  @news.get_latest_article
end

And /^i enter this text in the search box and click search/ do
  @news.input_text_in_search
end

Then /^i should get the news result/ do
  @news.expand_news_section
  raise ElementNotPresentError, "News article not there" unless @news.article_text == @news.article_present
end

Given /^that i have logged in to my account$/ do
  @current_car = site.my_vw.current_car_dashboard
  @current_car.visit
  site.my_vw.login.login(@account[0],@account[1])
end

When /^the current car dashboard page has loaded$/ do
  pending("Missing Username on login currently...")
end

Then /^I should be greeted with my current car dashboard and my name$/ do
  raise AssertionError, "My name not present" unless @current_car.my_name_present?
end


When /^i check the content of the hero module$/ do
  @current_car.wait_for_load
  @hero_present = @current_car.hero_text_present?
end

Then /^i should see a hero tagline with my car name$/ do
  expect(@hero_present).to be true
end

And /^i should also see a camera icon on the page$/ do
  expect(@current_car.camera_icon_present?).to be true
end

When /^i check the content of the service retailer module$/ do
  @current_car.wait_for_load
end

Then /^i should see a map loaded displaying my retailer location$/ do
  expect(@current_car.retailer_map_present?).to be true
end

And /^i should also see the following retailer address details displayed:$/ do |table|
  data = table.raw
  retailer_address = @current_car.get_retailer_address
  data.each do |column|
    expect(retailer_address).to match(/#{column}/i)
  end
end

And /^i should see the following contact details:$/ do |table|
  data = table.raw
  phone_details = @current_car.get_retailer_contact('Phone')
  fax_details = @current_car.get_retailer_contact('Fax')
  email_details = @current_car.get_retailer_contact('Email')

  expect(phone_details).to match(data[1][0])
  expect(fax_details).to match(data[1][1])
  expect(email_details).to match(data[1][2])
end

When /^i click on the link to view my retailers website$/ do
  @current_car.click_my_retailer_link
end

Then /^i should see the retailer page for "(.*)" load in my browser$/ do |retailer_name|
  #sleep(5)
  #site.retailer_pages.dismiss_google_maps_modal
  site_name = site.retailer_pages.get_retailer_name
  expect(site_name).to eq(retailer_name)
end

When /^i click on a (.*) link in the service guarantee module$/ do |gurantee|
  @current_car.click_a_gurantee(gurantee)
end

Then /^the (.*) page should load successfully in my browser$/ do |page|
  case page
  when 'service-promise'
    expect{site.owners.servicing.service_promise.page_loaded?}.not_to raise_error
  when 'what-we-check-and-why'
    expect{site.owners.servicing.what_we_check_and_why.page_loaded?}.not_to raise_error
  when 'volkswagen-genuine-parts'
    expect{site.owners.servicing.volkswagen_genuine_parts.page_loaded?}.not_to raise_error
  end
end

When /^i check the service history and plans section of my account$/ do

end

Then /^i should see a message prompting me to enter my postcode for more information$/ do
end

When /^i am on the promo modules section$/ do
  #Nothing to do here
end

Then /^i should see the (.*) promotion$/ do |promotions|
  raise AssertionError, "promotion not present" unless @current_car.promotions_present?(promotions)
end

And /^the promotion headline$/ do
  raise AssertionError, "promotion headline is not there" unless @current_car.promo_headline_offer_present?
end

When /^i am on need help module$/ do
  #Nothing to do here
end

Then /^i should see the need help search bar$/ do
  raise AssertionError, "Need help search bar not present" unless @current_car.need_help_search_present?
end

And /^the following (.*) section appears$/ do |useful_links|
  raise AssertionError, "Link not present" unless @current_car.check_useful_link_present?(useful_links)
end

When /^i search for (.*) in the need help section$/ do |help|
  #@current_car.search_help(help)
  pending
end

Then /^i should get a (.*) from my need help search$/ do |result|
  pending
end

When /^i am on the Current dashboard$/ do
  #Nothing to do here
end

Then /^i should see my preferred retailer$/ do
  raise AssertionError, "My preferred retailer not present" unless @current_car.my_retailer_present?
end

And /^the (.*) link in the box$/ do |links|
  raise AssertionError, "link not present" unless @current_car.retailer_links_present?(links)
end

When /^i scroll to the bottom of the page$/ do
  #Nothing to do here
end

Then /^the (.*) button should appear for the user$/ do |buttons|
  raise AssertionError, "Button not present" unless @current_car.check_relevant_buttons_present?(buttons)
end

Then(/^a default picture of my last added car type (.*) is displayed$/) do |car_type|
  expect(site.my_vw.current_car_dashboard.my_car_photo).to eq(car_type)
end

When /^my last added car name is (.*)$/ do |car_name|
  current_car = site.my_vw.current_car_dashboard
  expect(current_car.my_car_hero.present?).to be true
  expect(current_car.my_car_hero.text).to eq(car_name)
end


And /^I will also see a camera icon on the page$/ do
  expect(site.my_vw.current_car_dashboard.camera_button.present?).to be true
end

Then /^I will see a map loaded displaying my retailer location$/ do
  expect(site.my_vw.current_car_dashboard.retailer_map.present?).to be true
end

And /^I will also see the following retailer address details displayed:$/ do |table|
  table.raw.each do |column|
    expect(site.my_vw.current_car_dashboard.retailer_address_details.text).to match(/#{column}/i)
  end
end

And /^I will see the following contact details:$/ do |table|
  current_car = site.my_vw.current_car_dashboard
  table.hashes.each do |hash|
    expect(current_car.retailer_contact_details('Phone')).to eq(hash['Phone'])
    expect(current_car.retailer_contact_details('Fax')).to eq(hash['Fax'])
    expect(current_car.retailer_contact_details('Email')).to eq(hash['Email'])
  end
end

When /^I click on the link to view my retailers website$/ do
  site.my_vw.current_car_dashboard.retailer_website_link.when_present.click
end

Then /^I will see the retailer page for (.*)$/ do |retailer_name|
  expect(site.retailer_pages.retailer_name_header.when_present.text).to eq(retailer_name)
end

Then /^the (.*) page should load successfully in my browser$/ do |page|
  case page
    when 'service-promise'
      expect { site.owners.servicing.service_promise.page_loaded? }.not_to raise_error
    when 'what-we-check-and-why'
      expect { site.owners.servicing.what_we_check_and_why.page_loaded? }.not_to raise_error
    when 'volkswagen-genuine-parts'
      expect { site.owners.servicing.genuine_parts.page_loaded? }.not_to raise_error
  end
end

When /^I scroll to my service history and plans$/ do
  site.my_vw.current_car_dashboard.scroll_to_service
end

Then /^I will see a message prompting me to enter my postcode for more information$/ do
  current_car = site.my_vw.current_car_dashboard
  expect(current_car.dbg_not_matched_message.present?).to be true
  expect(current_car.owner_postcode_field.present?).to be true
end

When /^I scroll to promotions offered$/ do
  site.my_vw.current_car_dashboard.scroll_to_promotions_section
end

Then /^I will see the (.*) offered$/ do |promotions|
  expect(site.my_vw.current_car_dashboard.promotions_by_title(promotions).present?).to be true
end


When /^I select the (.*) offering$/ do |promotions|
  site.my_vw.current_car_dashboard.promotions_by_title(promotions).when_present.click
end


Then /^I will be on the correct page related to the (.*)$/ do |page_name|
  owners_site = site.owners
  case page_name
    when 'Fixed price servicing'
      Watir::Wait.until { owners_site.servicing.fixed_price_servicing.page_title_subject == page_name }
      expect(owners_site.servicing.fixed_price_servicing.page_title_subject).to eq(page_name)
    when 'Extended warranty'
      page_name = 'Extended Warranty'
      Watir::Wait.until { owners_site.servicing.extended_warranty.page_title_subject == page_name }
      expect(owners_site.servicing.extended_warranty.page_title_subject).to eq(page_name)
    when 'Accessories'
      page_name = 'Accessories and merchandise'
      Watir::Wait.until { owners_site.accessories.page_title == page_name }
      expect(owners_site.accessories.page_title).to eq(page_name)
  end
end

When /^I scroll to need help section/ do
  site.my_vw.current_car_dashboard.scroll_to_help
end

Then /^I will see the need help search field$/ do
  expect(site.my_vw.current_car_dashboard.need_help_search_field.present?).to be true
end

And /^the following (.*) sections are present$/ do |useful_links|
  site.my_vw.current_car_dashboard.useful_link(useful_links).present?
end

But /^when I click on find out more (.*)$/ do |useful_links|
  site.my_vw.current_car_dashboard.useful_link(useful_links).when_present.click
end

Then /^the correct page related to (.*) will be loaded$/ do |page_name|
  owners_site = site.owners
  case page_name
    when 'Owner\'s manual'
      page_name = page_name.gsub('\'', '') + 's'
      Watir::Wait.until { owners_site.owners_manuals.page_title == page_name }
      expect(owners_site.owners_manuals.page_title).to eq(page_name)
    when 'Warning lights'
      Watir::Wait.until { owners_site.warning_lights.page_title == page_name }
      expect(owners_site.warning_lights.page_title).to eq(page_name)
    when 'How tos'
      page_name = 'How to guides'
      Watir::Wait.until { owners_site.how_to_guides.page_title == page_name }
      expect(owners_site.how_to_guides.page_title).to eq(page_name)
    when 'Breakdown and insurance'
      page_name = 'Breakdown and Insurance'
      Watir::Wait.until { owners_site.breakdown_insurance.page_title == page_name }
      expect(owners_site.breakdown_insurance.page_title).to eq(page_name)
  end
end

When /^I search for (.*) in the need help section$/ do |query|
  current_car = site.my_vw.current_car_dashboard
  current_car.need_help_search_field.when_present.set(query)
  current_car.need_help_search_button.when_present.click
end

Then(/^I should see the (.*) page$/) do |page_title|
  need_help = site.need_help
  Watir::Wait.until(60) { need_help.page_title == page_title }
  expect(need_help.page_title).to eq(page_title)
end

But(/^I will get (true|false) for my searched (.*)$/) do |results, query|
  need_help = site.need_help
  Watir::Wait.until { need_help.search_results_query == query }
  expect(need_help.search_results_query).to eq(query)
  if results =~ /true/
    expect(need_help.question_results.present?).to be true
  else
    expect(need_help.question_results.present?).to be false
  end
end

When /^I scroll to the bottom of the page$/ do
  site.my_vw.current_car_dashboard.scroll_footer_buttons
end

Then /^the (.*) should appear for the user$/ do |buttons|
  expect(site.my_vw.current_car_dashboard.footer_buttons(buttons).present?).to be true
end

When /^I select the footer (.*)$/ do |buttons|
  site.my_vw.current_car_dashboard.footer_buttons(buttons).when_present.click
end

Then /^I will be on the (.*) page$/ do |buttons|
  case buttons
    when 'Book a service'
      Watir::Wait.until { site.service_booking.step1.page_loaded? }
      expect(site.service_booking.step1.page_loaded?).to be true
    when 'Keep me informed'
      Watir::Wait.until { site.new_cars.keep_informed.page_loaded? }
      expect(site.new_cars.keep_informed.page_loaded?).to be true
    when 'Contact Us'
      Watir::Wait.until { site.special_pages.contact_us.page_loaded? }
      expect(site.special_pages.contact_us.page_loaded?).to be true
  end
end

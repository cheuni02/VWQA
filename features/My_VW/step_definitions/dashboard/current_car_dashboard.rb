Then(/^I will be welcomed to add a car as none are present for my account$/) do
  expect(site.my_vw.current_car_dashboard.my_car_hero.present?).to be false
  expect(site.my_vw.current_car_dashboard.add_car_link.present?).to be true
end

Then(/^a default picture of my last added car type (.*) is displayed$/) do |car_type|
  current_car = site.my_vw.current_car_dashboard
  Watir::Wait.until { current_car.current_car_hero.present? }
  expect(current_car.my_car_photo).to eq(car_type)
  @car_id = site.my_vw.add_current_car_step_3.car_id
end

When(/^my last added car name is (.*)$/) do |car_name|
  current_car = site.my_vw.current_car_dashboard
  expect(current_car.my_car_hero.present?).to be true
  expect(current_car.my_car_hero.text).to eq(car_name)
end

And(/^I will also see a camera icon on the page$/) do
  expect(site.my_vw.current_car_dashboard.camera_button.present?).to be true
end

Then(/^I will see a map loaded displaying my retailer location$/) do
  expect(site.my_vw.current_car_dashboard.retailer_map.present?).to be true
end

And(/^I will also see the following retailer address details displayed:$/) do |table|
  table.raw.each do |column|
    expect(site.my_vw.current_car_dashboard.retailer_address_details.text).to match(/#{column}/i)
  end
end

And(/^I will see the following contact details:$/) do |table|
  current_car = site.my_vw.current_car_dashboard
  table.hashes.each do |hash|
    expect(current_car.retailer_contact_details('Phone')).to eq(hash['Phone'])
    expect(current_car.retailer_contact_details('Fax')).to eq(hash['Fax'])
    expect(current_car.retailer_contact_details('Email')).to eq(hash['Email'])
  end
end

When(/^I click on the link to view my retailers website$/) do
  site.my_vw.current_car_dashboard.retailer_website_link.when_present.click
end

Then(/^I will see the retailer page for (.*)$/) do |retailer_name|
  expect(site.retailer_pages.retailer_name_header.when_present.text).to eq(retailer_name)
end

When(/^I scroll to my service history and plans$/) do
  site.my_vw.current_car_dashboard.scroll_to_service_plans_history
end

Then(/^I will see my service history and plans details:$/) do |table|
  current_car = site.my_vw.current_car_dashboard
  expect(current_car.service_plans_history_populated.present?).to be true
  table.hashes.each_with_index { |(hash), index| hash.each { |key, value| expect(current_car.service_type(index, key)).to eq(value) } }
end

But(/^I will see a show more button$/) do
  expect(site.my_vw.current_car_dashboard.service_plans_history_show_more.present?).to be true
end

When(/^I select the show more button$/) do
  site.my_vw.current_car_dashboard.service_plans_history_show_more.when_present.click
end

When(/^I scroll to my plan$/) do
  site.my_vw.current_car_dashboard.scroll_to_my_plan
end

Then(/^I will see my plan details:$/) do |table|
  current_car = site.my_vw.current_car_dashboard
  expect(current_car.service_plan_section.present?).to be true
  table.hashes.each { |hash| hash.each { |key, value| expect(current_car.plan_section(key)).to eq(value) } }
end

Then(/^I will see a message prompting me to enable service history and plans feature$/) do
  current_car = site.my_vw.current_car_dashboard
  expect(current_car.service_plans_history.p.present?).to be true
  expect(current_car.service_plans_history.p.text).to include(' Please check or update your address to enable this feature')
  expect(current_car.enable_service_history_feature.present?).to be true
end

When(/^I click on enable service feature$/) do
  site.my_vw.current_car_dashboard.enable_service_history_feature.when_present.click
end

Then(/^I'm on my account page$/) do
  expect(site.my_vw.profile.hero_title.present?).to be true
end

When(/^I select read more link about my plan$/) do
  site.my_vw.current_car_dashboard.read_more_about_plan.when_present.click
end

When(/^I scroll to promotions offered$/) do
  site.my_vw.current_car_dashboard.scroll_to_promotions_section
end

Then(/^I will see the (.*) offered$/) do |promotions|
  expect(site.my_vw.current_car_dashboard.promotions_by_title(promotions).present?).to be true
end

When(/^I select the (.*) offering$/) do |promotions|
  select_offering = site.my_vw.current_car_dashboard.promotions_by_title(promotions)
  5.times { break select_offering.when_present.click if select_offering.present? }
end

Then(/^I will be on the correct page related to the (.*)$/) do |page_name|
  owners_site = site.owners
  case page_name
  when 'Fixed price servicing'
    page_name = page_name.split(' ').map(&:capitalize).join(' ')
    page_title = owners_site.servicing.fixed_price_servicing.page_title_subject
  when 'Volkswagen service plans'
    page_name = page_name.split(' ').map(&:capitalize).join(' ')
    page_title = owners_site.servicing.volkswagen_service_plans.page_title_subject
  when 'Extended warranty'
    page_name = page_name.split(' ').map(&:capitalize).join(' ')
    page_title = owners_site.servicing.extended_warranty.page_title_subject
  when 'Accessories'
    page_name = 'Accessories and merchandise'
    page_title = owners_site.accessories.page_title
  end
  Watir::Wait.until { page_title == page_name }
  expect(page_title).to eq(page_name), 'Expected: ' + page_name + ' Got: ' + page_title
end

When(/^I scroll to need help section/) do
  site.my_vw.current_car_dashboard.scroll_to_help
end

Then(/^I will see the need help search field$/) do
  expect(site.my_vw.current_car_dashboard.need_help_search_field.present?).to be true
end

And(/^the following (.*) sections are present$/) do |useful_links|
  site.my_vw.current_car_dashboard.useful_link(useful_links).present?
end

But(/^when I click on find out more (.*)$/) do |useful_links|
  find_out_more = site.my_vw.current_car_dashboard.useful_link(useful_links)
  3.times { break find_out_more.when_present.click if find_out_more.present? }
end

Then(/^the correct page related to (.*) will be loaded$/) do |page_name|
  owners_site = site.owners
  case page_name
  when 'Owner\'s manual'
    page_name = page_name.delete('\'') + 's'
    page_title = owners_site.owners_manuals.page_title
  when 'Warning lights'
    page_title = owners_site.warning_lights.page_title
  when 'How tos'
    page_name = 'How to guides'
    page_title = owners_site.how_to_guides.page_title
  when 'Breakdown and insurance'
    page_name = 'Breakdown and Insurance'
    page_title = owners_site.breakdown_insurance.page_title
  end
  Watir::Wait.until { page_title == page_name }
  expect(page_title).to eq(page_name)
end

When(/^I search for (.*) in the need help section$/) do |query|
  current_car = site.my_vw.current_car_dashboard
  current_car.need_help_search_field.when_present.set(query)
  search_help = current_car.need_help_search_button
  3.times { break search_help.when_present.click if search_help.present? }
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

When(/^I scroll to the bottom of the page$/) do
  site.my_vw.current_car_dashboard.scroll_footer_buttons
end

Then(/^the (.*) should appear for the user$/) do |buttons|
  expect(site.my_vw.current_car_dashboard.footer_buttons(buttons).present?).to be true
end

When(/^I select the footer (.*)$/) do |buttons|
  site.my_vw.current_car_dashboard.footer_buttons(buttons).when_present.click
end

Then(/^I will be on the (.*) page$/) do |buttons|
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

Given(/^I have added a new car to my account with:$/) do |table|
  options = table.raw.inject({}) { |k, v| k.merge!(v[0] => v[1]) }
  token = site.my_vw.my_vw_api.get_login_token(@account[:username], @account[:password])
  site.my_vw.my_vw_api.add_new_current_car(@account[:uuid], token,
                                           display_name: options['Display name'],
                                           car_status: options['Car status'],
                                           registration: options['Registration'],
                                           model: options['Model'],
                                           derivative: options['Derivative'],
                                           registration_date: options['Registration date'],
                                           fuel_type: options['Fuel type'],
                                           vin: options['Vin'],
                                           year: options['Year of manufacture'],
                                           engine_capacity: options['Engine capacity'],
                                           transmission: options['Transmission'],
                                           purchase_type: options['Purchase type'])
end

Then(/^there is no service history for my car at present$/) do
  current_car = site.my_vw.current_car_dashboard
  expect(current_car.service_history_section.present?).to be true
  expect(current_car.service_history_section.p.text).to include('We do not have any service history for your car at present.')
end

Then(/^there is no volkswagen plans$/) do
  current_car = site.my_vw.current_car_dashboard
  expect(current_car.service_plan_section.present?).to be true
  expect(current_car.service_plan_section.p.text).to include('You do not appear to have any Volkswagen service plan.')
end

When(/^I select I'm interested in fixed price servicing link$/) do
  site.my_vw.current_car_dashboard.service_plan_section.link.click
end

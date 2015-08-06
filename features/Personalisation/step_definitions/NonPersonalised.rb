Given /^i navigate my browser to the Volkswagen homepage$/ do
  site.clear_cookies
  site.visit_provineer
  site.set_cookies('pa', ENV['NPCOOKIE'], {:path => '/ProvIM/ProvAnalytics/', :expires => Time.now + 86400, :secure => false})
  #site.print_cookies
  site.homepage.visit
end

And /^i ensure that i am not using the personalised workflow$/ do
  #site.delete_cookie('pa')
  #site.set_cookies('pa', '0cc0e548_14be4c5c9fe_07f5e14be9ccb5e3_7f000001', {:path => "/", :expires => Time.now + 86400, :secure => false})
  #site.set_cookies('pa', "0510fdc0e_14ce1f2544c_0d3814ce6225eb9_7f000001", {:path => "/", :expires => Time.now + 86400, :secure => false})
  #sleep(1000)
  #site.homepage.visit
  site.homepage.visit
  site.set_cookies('ico-cookies', 'true', {:path => "/", :expires => Time.now + 86400, :secure => false})
  #site.print_cookies
  # Pending
end


When /^i navigate to the MLP Page for (.*) on the website$/ do |model|
  site.primary_nav.click_new_cars
  new_car = site.new_cars
  new_car.select_model(model)
  new_car.confirm_model
  new_car.wait_for_mlp_load
end

And /^i return back to the Volkswagen site homepage$/ do
  site.homepage.visit
  #sleep(1000)
  #sleep(5)
  site.homepage.dismiss_cookies
end

Then /^i should see that links to "(.*)" and "(.*)" are still displayed$/ do |link1, link2|
  site.homepage.wait_for_quicklinks
  raise ElementNotPresentError, "Could not find homepage quick link element #{link1}" unless site.homepage.quick_link_present?(link1) == 1
  raise ElementNotPresentError, "Could not find homepage quick link element #{link2}" unless site.homepage.quick_link_present?(link2) == 1
end

And /^the default carousel is displayed on the Volkswagen Homepage$/ do
  pending
end

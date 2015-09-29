Before('@login') do
  #page = CustomWorld::browser.url
  @account = site.my_vw.register.register_default_account
  site.owners.wait_for_page
  #CustomWorld::browser.goto page
end

After('@login') do
  begin
    site.my_vw.primary_nav.click_logout
    site.owners.wait_for_page
  rescue Watir::Exception::UnknownObjectException #We might already be logged out
    #
  end
end

Before('@noissues') do
end

After ('@noissues') do
end

After ('@logout') do
  site.my_vw.primary_nav.click_logout
  #site.owners.wait_for_page
end

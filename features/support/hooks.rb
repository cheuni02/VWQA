Before('@login') do
  @account = site.my_vw.login.get_login_details('General')
end

After('@login') do
  begin
    site.my_vw.primary_nav.click_logout
    site.owners.wait_for_page
  rescue Watir::Exception::UnknownObjectException #We might already be logged out
    #
  end
end

# Hook for Registering a Temporary Volkswagen.co.uk account
# USE THIS SPARINGLY! Will Spam the DB with test accounts if not carefully used!
# Should be used for tests such as account lockout to avoid locking out the
# general purpose account for other tests
Before('@Register_temp') do
  @account = site.my_vw.register.register_default_account
end

After ('@logout') do
  site.my_vw.primary_nav.click_logout
  #site.owners.wait_for_page
end

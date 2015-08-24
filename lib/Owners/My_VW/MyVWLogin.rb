class MyVWLogin < MyVW

  def visit
    visit_page(page_url)
  end
  
  def page_loaded?
    login_button.present?
  end
  
  def set_email(email)
    username_field.set(email)
  end
  
  def set_password(password)
    password_field.set(password)
  end
  
  def do_login
    login_button.click
  end

  def login(username, password)
    page_loaded?
    set_email(username)
    set_password(password)
    do_login
  end

  def login_active?
    login_active.present?
  end

  def login_inactive?
    login_inactive.present?
  end

  def my_profile_edit
    my_profile.click
  end

  def delete_account_click
    delete_account.click
    @browser.alert.exists?
    @browser.alert.ok
  end

  private

  def page_url
    "/vw-authentication/login/auth?targetUrl=/owners/my/cars"
  end
  
  def username_field
    @browser.text_field(:id => "username")
  end
  
  def password_field
    @browser.text_field(:id => "password")
  end
  
  def login_button
    @browser.button(:id => "login-button")
  end

  def login_active
    @browser.div(:id => "top-bar").li(:class => "user-link login active")
  end

  def login_inactive
    @browser.div(:id => "top-bar").li(:class => "user-link login")
  end

  def my_profile
    @browser.link(:id => "owner-profile-link")
  end

  def delete_account
    @browser.link(:id => "delete-account")
  end

end

#AutomatedToastUser1411049431@example.com
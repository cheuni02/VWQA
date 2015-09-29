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

end

#AutomatedToastUser1411049431@example.com
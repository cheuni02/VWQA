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

  def login_link
    @browser.element(class: 'user-link')
  end

  def login(username, password)
    page_loaded?
    set_email(username)
    set_password(password)
    do_login
  end

  # Gets the Login Details for a specified user account purpose
  # These are defined in user.json by hostname
  def get_login_details(purpose, host = ENV['HOST'])
    accounts = JSON.parse(File.read('users.json'))['User_accounts'][host]
    accounts.each do |account|
      if account['purpose'] == purpose
        return [account['username'], account['password'], account['uuid']]
      end
    end
  end

  def get_account_details(purpose, host = ENV['HOST'])
    accounts = JSON.parse(File.read('users.json'), symbolize_names: true)[:User_accounts][host.to_sym]
    accounts.collect {|detail| detail if detail[:purpose] == purpose }.compact.first
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

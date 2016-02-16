class MyVWLogin < MyVW
  def visit
    visit_page(page_url)
  end

  def page_loaded?
    login_button.present?
  end

  def set_email(email)
    @browser.execute_script("document.getElementById('username').value = '#{email}'")
  end

  def set_password(password)
    @browser.execute_script("document.getElementById('password').value = '#{password}'")
  end

  def do_login
    login_button.when_present.click
  end

  def login_link
    @browser.element(class: 'user-link')
  end

  def logout
    @browser.element(class: 'logout')
  end

  def login(username, password)
    page_loaded?
    until username_field.value == username && password_field.value == password
      set_email(username)
      set_password(password)
    end
    do_login while login_button.present?
  end

  def account_navigation_bar
    @browser.element(class: 'welcome-stripe__menu  push-right')
  end

  def login_error_message
    @browser.div(id: 'passwd-form')
  end

  def email_validation_error
    @browser.div(class: 'my-input my-car-form__top-spacer').div(class: 'my-input__input').p(class: 'error-label')
  end

  def password_validation_error
    @browser.div(class: 'my-input my-car-form__top-spacer', index: 1).div(class: 'my-input__input').p(class: 'error-label')
  end

  def account_not_recognised
    @browser.div(class: 'my-input my-car-form__top-spacer', index: 1).div(class: 'my-input__input').p(class: 'error-label')
  end

  # Gets the Login Details for a specified user account purpose
  # These are defined in user.json by hostname
  def get_account_details(purpose, host = ENV['HOST'])
    accounts = JSON.parse(File.read('users.json'), symbolize_names: true)[:User_accounts][host.to_sym]
    if accounts.nil?
      fail('There seems to be a problem with loading users.json, please check hostname')
    else
      accounts.collect { |detail| detail if detail[:purpose] == purpose }.compact.first
    end
  end

  def lockout_page
    @browser.div(id: 'welcome-header', text: /account locked/i)
  end

  def lockout_page_forgot_pw_link
    @browser.link(class: 'vw-btn vw-btn-active vw-btn-spaced')
  end

  def remember_me_checkbox
    @browser.checkbox(id: 'remember_me')
  end

  def remember_me_cookie_set?
    @browser.cookies['VW_AUTH_REMEMBER_ME']
  end

  def logged_in_cookie_set?
    @browser.cookies['VW_AUTH']
  end

  def create_account_link
    @browser.a(data_content: 'my-registration-sign-up')
  end

  def forgotten_password_link
    @browser.link(id: 'forgot-password-link')
  end

  def page_url
    '/vw-authentication/login/auth?targetUrl=/owners/my/cars'
  end

  def username_field
    @browser.text_field(id: 'username')
  end

  def password_field
    @browser.text_field(id: 'password')
  end

  def login_button
    @browser.button(id: 'login-button')
  end
end

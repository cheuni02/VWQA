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
    5.times do
      set_email(username) until username_field.value == username
      set_password(password) until password_field.value == password
    end
    5.times { do_login while login_button.present? }
  end

  def account_navigation_bar
    @browser.element(class: 'welcome-stripe__menu')
  end

  def login_success_message
    @browser.div(class: 'my-car-form__success')
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

  def keep_me_logged_in_check
    @browser.execute_script("document.getElementById('remember_me').checked = true")
  end

  def keep_me_logged_in_set?
    @browser.checkbox(id: 'remember_me').set?
  end

  def keep_me_logged_in_cookie_set?
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

  def open_new_window
    @browser.execute_script( "window.open()")
  end

  def close_first_window
    @browser.windows.first.close
  end

  def current_url
    @browser.url
  end

  def link_sent_flash_message
    @browser.div(id: 'my-registration-flash')
  end

  def verification_link
    @browser.link(id: 'send-email-link')
  end
end

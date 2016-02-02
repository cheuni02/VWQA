class MyVWRegister < MyVW

  def visit
    visit_page(page_url)
  end

  def page_loaded?
    @browser.text_field(:id => "firstName").wait_until_present
  end


  ### Remove me later (Once My VW Released)
  def register_default_account
    timestamp = Time.now.to_i
    email = DEFAULT_ACCOUNT[:first_name] + "#{timestamp}" + DEFAULT_ACCOUNT[:email_base]

    self.visit

    title_select_list.select(DEFAULT_ACCOUNT[:title])
    first_name_field.set(DEFAULT_ACCOUNT[:first_name] + "#{timestamp}")
    surname_field.set(DEFAULT_ACCOUNT[:surname] + "#{timestamp}")
    email_field.set(email)
    password_field.set(DEFAULT_ACCOUNT[:password])
    set_password_confirm(DEFAULT_ACCOUNT[:password])
    registration_button.click

    self.primary_nav.click_logout

    return [email, DEFAULT_ACCOUNT[:password]]
  end

  def register_default_account_new

    timestamp = Time.now.to_i
    email = DEFAULT_ACCOUNT[:first_name] + "#{timestamp}" + DEFAULT_ACCOUNT[:email_base]

    self.visit
    create_account_link.click
    title_select_list.set(DEFAULT_ACCOUNT[:title])
    first_name_field.set(DEFAULT_ACCOUNT[:first_name] + "#{timestamp}")
    surname_field.set(DEFAULT_ACCOUNT[:surname] + "#{timestamp}")
    email_field.set(email)
    password_field.set(DEFAULT_ACCOUNT[:password])
    password_confirm_new.set (DEFAULT_ACCOUNT[:password])
    registration_button.click

    return [email, DEFAULT_ACCOUNT[:password]]


  end

  def email_taken_message
    email_taken_error.text
  end

  def title_select_list
    @browser.text_field(:class =>"my-selectbox__input")
  end

  def first_name_field
    @browser.text_field(:id => "firstName")
  end

  def surname_field
    @browser.text_field(:id => "surname")
  end

  def email_field
    @browser.text_field(:id => "email")
  end

  def password_field
    @browser.text_field(:id => "registerPassword")
  end

  def set_password_confirm(my_password)
    password_verify.set(my_password)
  end

  def password_confirm_new
    @browser.text_field(:name => "repeatPassword")
  end

  def registration_button
    @browser.button(:id => "register-button")
  end

  def get_error_messages
    arr = []
    get_all_messages.each do |message|
      arr.push(message.text) if message.present?
    end
    return arr
  end

  def submit_registration
    submit_registration_button.click
  end

  def get_validation
    validation_message
  end

  def register_form
    register_form_locator
  end

  def thank_you_page_present
    success_registration.present?
  end

  private

  def page_url
    "/vw-authentication/register/index?targetUrl=%2Fowners%2Fmy%2Fcars"
  end

  def password_verify
    @browser.text_field(:id => "repeatPassword")
  end

  def submit_registration_button
    @browser.button(:id => "register-button")
  end

  def register_form_locator
    @browser.form(:id => 'register-form')
  end

  def create_account_link
    @browser.a(:data_content => "my-registration-sign-up")
  end

  def success_registration
    @browser.div(:class => "my-registration__login")
  end

  def get_all_messages
    @browser.execute_script('return document.getElementsByClassName("error-label")')
  end

  def email_taken_error
    @browser. ol(:class => "my-car-form__errors").li
  end
end

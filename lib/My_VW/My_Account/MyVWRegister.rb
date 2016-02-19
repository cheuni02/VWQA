class MyVWRegister < MyVW
  def visit
    visit_page(page_url)
  end

  def page_loaded?
    @browser.text_field(id: 'firstName').wait_until_present
  end

  def page_not_found
    visit_page(page_url_broken)
  end

  ### Remove me later (Once My VW Released)
  def register_default_account
    timestamp = Time.now.to_i
    email = DEFAULT_ACCOUNT[:first_name] + timestamp.to_s + DEFAULT_ACCOUNT[:email_base]

    visit

    title_select_list.select(DEFAULT_ACCOUNT[:title])
    first_name_field.set(DEFAULT_ACCOUNT[:first_name] + timestamp.to_s)
    surname_field.set(DEFAULT_ACCOUNT[:surname] + timestamp.to_s)
    email_field.set(email)
    password_field.set(DEFAULT_ACCOUNT[:password])
    set_password_confirm(DEFAULT_ACCOUNT[:password])
    registration_button.click

    primary_nav.click_logout

    [email, DEFAULT_ACCOUNT[:password]]
  end

  def register_default_account_new
    timestamp = Time.now.to_i
    email = DEFAULT_ACCOUNT[:first_name] + timestamp.to_s + DEFAULT_ACCOUNT[:email_base]

    visit
    create_account_link.click
    @browser.execute_script("document.getElementById('my-registration-title').value= 'Mr'")
    @browser.execute_script("document.getElementById('firstName').value = '#{DEFAULT_ACCOUNT[:first_name]}#{timestamp}'")
    @browser.execute_script("document.getElementById('surname').value = '#{DEFAULT_ACCOUNT[:surname]}#{timestamp}'")
    @browser.execute_script("document.getElementById('email').value = '#{email}'")
    @browser.execute_script("document.getElementById('registerPassword').value = '#{DEFAULT_ACCOUNT[:password]}'")
    @browser.execute_script("document.getElementsByName('repeatPassword')[0].value = '#{DEFAULT_ACCOUNT[:password]}'")

    # sleep(10)
    registration_button.click

    return { username: email, password: DEFAULT_ACCOUNT[:password] }
  end


  def email_taken_message
    email_taken_error.text
  end

  def title_select_list
    @browser.text_field(class: 'my-selectbox__input')
  end

  def first_name_field
    @browser.text_field(id: 'firstName')
  end

  def surname_field
    @browser.text_field(id: 'surname')
  end

  def email_field
    @browser.text_field(id: 'email')
  end

  def password_field
    @browser.text_field(id: 'registerPassword')
  end

  def set_password_confirm(my_password)
    password_verify.set(my_password)
  end

  def password_confirm_new
    @browser.text_field(name: 'repeatPassword')
  end

  def registration_button
    @browser.button(id: 'register-button')
  end

  def get_error_messages
    arr = []
    get_all_messages.each do |message|
      arr.push(message.text) if message.present?
    end
    arr
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

  def page_not_available
    @browser.h1(:class => "error-title-static")
  end

  private

  def page_url
    '/vw-authentication/register/index?targetUrl=%2Fowners%2Fmy%2Fcars'
  end

  def page_url_broken
    "/vw-authentication/verification/verify?token=YTgzNTNhNjMtMzE2YS00ZjJjLWI4ODgtN2QwOWM5Mjc4YjczOjXXXXXXXXX******"
  end

  def password_verify
    @browser.text_field(id: 'repeatPassword')
  end

  def submit_registration_button
    @browser.button(id: 'register-button')
  end

  def register_form_locator
    @browser.form(id: 'register-form')
  end

  def create_account_link
    @browser.a(data_content: 'my-registration-sign-up')
  end

  def success_registration
    @browser.div(class: 'my-registration__login')
  end

  def get_all_messages
    @browser.execute_script('return document.getElementsByClassName("error-label")')
  end

  def email_taken_error
    @browser. ol(class: 'my-car-form__errors').li
  end
end

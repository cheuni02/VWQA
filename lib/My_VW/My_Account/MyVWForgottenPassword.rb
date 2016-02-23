class MyVWForgottenPassword < MyVW
  def visit
    visit_page(page_url)
  end

  def visit_reset_page(reset_page_url)
    visit_page(reset_page_url)
  end

  def page_loaded?
    page_title.present?
    email_field.present?
  end

  def set_email(email)
    @browser.execute_script("document.getElementById('email').value = '#{email}'")
  end

  def set_new_password_script(password)
    @browser.execute_script("document.getElementById('password').value = '#{password}'")
  end

  def get_reset_tokens
    tokens = JSON.parse(File.read('reset_tokens.json'))
  end

  def write_reset_json(tokens)
    File.open('reset_tokens.json', 'w') do |file|
      # my_json = users.to_json
      file.write(JSON.pretty_generate(tokens))
    end
  end

  def get_reset_token(email)
    tokens = get_reset_tokens
    tokens[email]
  end

  def set_user_reset_link(email, link)
    tokens = get_reset_tokens
    tokens[email] =
    {
      reset_link: link,
      timestamp: Time.now.to_i
    }

    write_reset_json(tokens)
  end

  def delete_user_reset_link(email)
    tokens = get_reset_tokens
    tokens.delete(email)
    write_reset_json(tokens)
  end

  def set_new_password(password)
    new_password.set(password)
  end

  def set_confirm_password(password)
    confirm_password.set(password)
  end

  def active_requirements_list
    list = []
    active_requirements.each do |element|
      list.push(element.div(class: 'my-pwd-indicator__text').text)
    end
    list
  end

  def email_field
    @browser.text_field(id: 'email')
  end

  def forgotten_password
    @browser.link(id: 'forgot-password-link')
  end

  def success_page_login
    @browser.link(class: 'my-vw-button')
  end

  def send_email
    @browser.button(id: 'submit-button')
  end

  def error_message
    @browser.p(class: 'error-label')
  end

  def page_url
    '/vw-authentication/forgotPassword/index'
  end

  def reset_page_url
    '/vw-authentication/forgotPassword/resetPassword?token='
  end

  def page_title
    @browser.div(class: 'grid-4').h2(text: 'Forgotten Password')
  end

  def return_to_login
    @browser.link(class: 'my-vw-button', text: 'Return to login')
  end

  def success_page_title
    @browser.h1(class: 'my-auth-hero__title', text: 'Success! Please verify your email.')
  end

  def verification_link
    @browser.link(id: 'send-email-link')
  end

  def new_password
    @browser.text_field(id: 'password')
  end

  def confirm_password
    @browser.text_field(id: 'repeatPassword')
  end

  def reset_password
    @browser.button(id: 'reset-button')
  end

  def active_requirements
    @browser.execute_script("return document.getElementsByClassName('my-pwd-indicator__item active')")
  end

  def new_password_validation_error
    @browser.div(class: 'my-input my-car-form__top-spacer', index: 0).div(class: 'my-input__input').p(class: 'error-label')
  end

  def confirm_password_validation_error
    @browser.div(class: 'my-input my-car-form__top-spacer', index: 1).div(class: 'my-input__input').p(class: 'error-label')
  end
end

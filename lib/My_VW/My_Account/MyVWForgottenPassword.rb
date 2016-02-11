class MyVWForgottenPassword < MyVW
  def visit
    visit_page(page_url)
  end

  def page_loaded?
    page_title.present?
    email_field.present?
  end

  def set_email(email)
    @browser.execute_script("document.getElementById('email').value = '#{email}'")
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
end

class MyVWForgottenPassword < MyVW

  def visit
    visit_page(page_url)
  end

  def page_loaded?
    page_title.present?
    email_field.present?
  end

  def success_page_loaded?
    success_page_title.present?
  end

  def flash_visible?
    email_sent_flash.visible?
  end

  def set_email (email)
    @browser.execute_script("document.getElementById('email').value = '#{email}'")
  end

  def email_field
    @browser.text_field(:id => "email")
  end

  def forgotten_password
    @browser.link(:id => "forgot-password-link")
  end

  def success_page_login
    @browser.link(:class => "my-vw-button")
  end

  def send_email
    @browser.button(:id => "submit-button")
  end

  def error_message
    @browser.p(:class => "error-label")
  end

  private

  def page_url
    "/vw-authentication/forgotPassword/index"
  end

  def page_title
    @browser.div(:class => "grid-4").h2(:text => "Forgotten Password")
  end

  def return_to_login
    @browser.link(:class => "my-vw-button", :text => "Return to login")
  end

  def success_page_title
    @browser.h1(:class => "full-hero__title", :text =>"Success! Please verify your email.")
  end


  # def email_sent_flash
  #   @browser.div(:id => "my-registration-flash")
  # end
end
class MyVWRegister < MyVW

  def visit
    visit_page(page_url)
  end

  def page_loaded?
    @browser.text_field(:id => "firstName").wait_until_present
  end


  ### Remove me later (Once My VW Released) ###
  def register_default_account
    timestamp = Time.now.to_i
    email = DEFAULT_ACCOUNT[:first_name] + "#{timestamp}" + DEFAULT_ACCOUNT[:email_base]

    #begin
    self.visit
      #@browser.div(:id => "uniform-title").click
    #  title.wait_until_present(10)
    #rescue Watir::Wait::TimeoutError
    #  retry
    #end

    #@browser.div(:id => "uniform-title").click
    set_title(DEFAULT_ACCOUNT[:title])
    set_first_name(DEFAULT_ACCOUNT[:first_name] + "#{timestamp}")
    set_surname(DEFAULT_ACCOUNT[:surname] + "#{timestamp}")
    set_email(email)
    set_password(DEFAULT_ACCOUNT[:password])
    set_password_confirm(DEFAULT_ACCOUNT[:password])
    submit_registration

    self.primary_nav.click_logout

    return [email, DEFAULT_ACCOUNT[:password]]
  end

  def register_default_account_new

    timestamp = Time.now.to_i
    email = DEFAULT_ACCOUNT[:first_name] + "#{timestamp}" + DEFAULT_ACCOUNT[:email_base]

    #begin
    self.visit
      #@browser.div(:id => "uniform-title").click
    #  title.wait_until_present(10)
    #rescue Watir::Wait::TimeoutError
    #  retry
    #end

    #@browser.div(:id => "uniform-title").click
    set_title(DEFAULT_ACCOUNT[:title])
    set_first_name(DEFAULT_ACCOUNT[:first_name] + "#{timestamp}")
    set_surname(DEFAULT_ACCOUNT[:surname] + "#{timestamp}")
    set_email(email)
    set_password(DEFAULT_ACCOUNT[:password])
    password_confirm_new.set (DEFAULT_ACCOUNT[:password])
    submit_registration

    return [email, DEFAULT_ACCOUNT[:password]]




  end

  def set_title(name)
    title.select(name)
  end

  def set_first_name(name)
    first_name.when_present.set(name)
  end

  def set_surname(name)
    surname.when_present.set(name)
  end

  def set_email(address)
    email.set(address)
  end

  def set_password(my_password)
    password.set(my_password)
  end

  def set_password_confirm(my_password)
    password_verify.set(my_password)
  end

  def password_confirm_new
    @browser.text_field(:id => "repeat-password")
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

  private

  def page_url
    "/vw-authentication/register/index?targetUrl=%2Fowners%2Fmy%2Fcars"
  end

  def title
    #@browser.select(:id => "title")
    @browser.execute_script("return document.getElementById('title')")
  end

  def first_name
    @browser.text_field(:id => "firstName")
  end

  def surname
    @browser.text_field(:id => "surname")
  end

  def email
    @browser.text_field(:id => "email")
  end

  def password
    @browser.text_field(:id => "password")
  end

  def password_verify
    @browser.text_field(:id => "repeatPassword")
  end

  def submit_registration_button
    @browser.button(:class => "vw-btn-active")
  end

  def validation_message
    @browser.ps(:class => "form-error")
  end

  def register_form_locator
    @browser.form(:id => 'register-form')
  end

end

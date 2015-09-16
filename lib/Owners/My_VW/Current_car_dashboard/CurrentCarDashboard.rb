class CurrentCarDashbaord < MyVW

  def visit
    visit_page(page_url)
  end

  def login_to_account
    set_username.set("#{username}")
    set_password.set("#{password}")
    click_login_button
  end

  def set_username
    username_field
  end

  def set_password
    password_box
  end

  def click_login_button
    logon_button.click
  end

  def my_name_present
    welcome_name.present?
  end

  def current_dashboard_section
    current_car_hero.present?
    my_car_nav_menu.present?
  end


private

def page_url
  "/vw-authentication/login/auth?targetUrl=/owners/my/cars"
end

def username
  "test123456@test.com"
end

def password
  "12345678"
end

def username_field
  @browser.text_field(:id => "username")
end

def password_box
  @browser.text_field(:id => "password")
end

def logon_button
  @browser.button(:id => 'login-button')
end

def my_car_nav_menu
  @browser.section(:class => "welcome-stripe").nav(:class => "welcome-stripe__menu")
end

def camera_button
  @browser.form(:id => "form-upload-image").a(:id => "img-placeholder-link")
end

def welcome_name
  @browser.section(:class => "welcome-stripe").div(:class => "welcome-stripe__notification")
end

def current_car_hero
  @browser.section(:class => "current-car-hero")
end

def upcoming_appointment_section
  @browser.section(:id => "upcoming_services").div(:class => "col-6 my-current-appointment__header")
end

def current_service_section
  @browser.section(:class => "my-current-service")
end

def current_service_overview
  @browser.section(:class => "my-current-service").div(:class => "my-current-service__content")
end

def current_service_reminders
  @browser.section(:class => "my-current-service").div(:class => "my-current-service__reminder")
end

def current_service_steps
  @browser.div(:class => "my-current-service__steps")
end

def retailer_map
  @browser.div(:class => "my-retailer__map")
end

def retailer_details
  @browser.div(:class => "my-retailer__overlay")
end

def service_gurantee_section
  @browser.div(:class => "my-current-guarantee__body").link(:href => "#{}")
end

def my_service_history_section
  @browser.section(:class => "my-current-history")
end

def service_history_table
  @browser.div(:class => "my-current-history__body").table(:class => "my-table--transparent")
end

end

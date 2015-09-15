class CurrentCarDashbaord < MyVW










private

def username
  test123456@test.com
end

def password
  12345678
end

def camera_button
  @browser.form(:id => "form-upload-image").a(:id => "img-placeholder-link")
end

def welcome_name
  @browser.section(:class => "welcome-stripe").div(:class => "welcome-stripe__notification")
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

def current_serice_steps
  @browser.div(:class => "my-current-service__steps")
end

def retailer_map
  @browser.div(:class => "my-retailer__map")
end

def retailer_details
  @browser.div(:class => "my-retailer__overlay")
end

def service_gurantee_section
  @browser.
end

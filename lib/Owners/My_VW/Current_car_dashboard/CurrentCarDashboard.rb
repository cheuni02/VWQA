require 'yaml'
class CurrentCarDashboard < MyVW

  def visit
    visit_page(page_url)
  end

  def login_valid_account
    get_credentials_valid
    set_username.set("#{username_valid}")
    set_password.set("#{password_valid}")
    click_login_button
  end

  def login_unvalidated_account
    get_credentials_unvalidated
    set_username.set("#{username_unvalidated}")
    set_password.set("#{password_unvalidated}")
    click_login_button
  end

  def get_credentials_valid
    grab_user_cred_valid
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

  def my_name_present?
    welcome_name.present?
  end

  def current_dashboard_section_present?
    current_car_hero.present?
    my_car_nav_menu.present?
  end

  def click_camera_icon
    camera_button.click
  end

  def upload_image_prompt
    close_image_picker.send_keys :enter
  end

  def my_service_gurantee_module_present?
    service_gurantee_section.present?
  end

  def click_a_gurantee(gurantee)
    @browser.div(:class => "my-current-guarantee__body").link(:href => "#{gurantee}").click
  end

  def check_page_url(page)
    relevant_page = page
    url = @browser.url
    page_url = url.split('/')
    if relevant_page == page_url.last
      return true
    else
      return false
    end
  end

  def my_service_history_present?
    current_service_section.present?
  end

    def my_service_history_table_present?
    service_history_table.visible?
  end

  def my_plans_present?
    volkswagen_plans_section.present?
  end

  def promo_section_present?
    promotion_section.present?
  end

  def promotions_present?(promotions)
    @browser.div(:class => "col-6 my-promo__features").a(:title => "#{promotions}").present?
  end

  def promo_headline_offer_present?
    promotion_headline.present?
  end

  def need_help_section_present?
    need_help_module.present?
  end

  def need_help_search_present?
    need_help_search_bar.present?
  end

  def check_useful_link_present?(useful_links)
    @browser.h5(:text => "#{useful_links}").present?
  end

  def my_vw_page_present?
    current_car_hero.present?
    my_retailer
  end

  def my_retailer_present?
    preferred_retailer.present?
  end

  def retailer_links_present?(links)
    @browser.div(:class => "my-retailer__hours").a(:text => "#{links}").present?
  end

  def recovery_zone_present?
    recovery_zone_buttons.present?
  end

  def check_relevant_buttons_present?(buttons)
    @browser.div(:class => "row my-offers__features").a(:text => "#{buttons}").present?
  end

  def search_help(help)
    @browser.text_field(:id => "searchTerm").set("#{help}")
    need_help_search_button.click
  end

  def search_help_result

  end

  def my_service_plans_box_present?
    my_service_plans_history.present?
  end

  def dbg_data_needed_present?
    owner_postcode_field.present?
    last_name_field.present?
  end

private

def page_url
  "/vw-authentication/login/auth?targetUrl=/owners/my/cars"
end

def username_valid
  @username_valid_user
end

def password_valid
  @password_valid_user
end

def username_unvalidated
  @username_unvalidated_user
end

def password_unvalidated
  @password_unvalidated_user
end

def username_field
  @browser.text_field(:id => "username")
end

def password_box
  @browser.text_field(:id => "password")
end

def get_credentials_unvalidated
  user_data = YAML.load_file('user_accounts.yml')
  @username_unvalidated_user = user_data[1]['username']
  @password_unvalidated_user = user_data[1]['password']
end

def grab_user_cred_valid
  user_data = YAML.load_file('user_accounts.yml')
  @username_valid_user = user_data[0]['username']
  @password_valid_user = user_data[0]['password']
end

def logon_button
  @browser.button(:id => 'login-button')
end

def current_car_polo
  @browser.div(:class => "my-cars-dropdown").h2(:text => "polobleu")
end

def my_car_nav_menu
  @browser.section(:class => "welcome-stripe").nav(:class => "welcome-stripe__menu")
end

def my_cars_link
  @browser.ul(:class => "welcome-stripe__menu-list", :index => 1).li(:class => "welcome-stripe__menu-list-item").a(:href => "#")
end

def camera_button
  @browser.form(:id => "form-upload-image").a(:id => "img-placeholder-link")
end

def close_image_picker
  @browser.form(:id => "form-upload-image")
  #@browser.execute_script("window.confirm = function() {return false}")
end

def welcome_name
  @browser.section(:class => "welcome-stripe").div(:class => "welcome-stripe__notification")
end

def current_car_hero
  @browser.section(:class => "current-car-hero")
end

def upcoming_appointment_section
  @browser.section(:id => "upcoming_services")
end

def current_service_section
  @browser.section(:class => "my-current-service")
end

def current_service_overview
  @browser.section(:class => "my-current-service").div(:class => "my-current-service__content")
end

def retailer_map
  @browser.div(:class => "my-retailer__map")
end

def retailer_details
  @browser.div(:class => "my-retailer__overlay")
end

def service_gurantee_section
  @browser.section(:class => "my-current-guarantee")
end

def my_service_history_section
  @browser.section(:class => "my-current-history")
end

def service_history_table
  @browser.div(:class => "my-current-history__body").table(:class => "my-table--transparent")
end

def volkswagen_plans_section
  @browser.section(:class => "my-current-plan")
end

def promotion_section
  @browser.section(:class => "my-promo")
end

def promotion_headline
   @browser.div(:class => "my-promo__headline")
end

def need_help_module
  @browser.section(:class => "my-help")
end

def need_help_search_bar
  @browser.text_field(:id => "searchTerm")
end

def need_help_search_button
  @browser.button(:id => "searchSubmit")
end

def preferred_retailer
  @browser.div(:class => "my-retailer__address").address(:class => "vcard")
end

def recovery_zone_buttons
  @browser.div(:class => "row my-offers__features")
end

def my_service_plans_history
  @browser.section(:class => "my-current-service-history")
end

def owner_postcode_field
  @browser.text_field(:id => "owner-postcode")
end

def last_name_field
  @browser.text_field(:id => "owner-surname")
end

end

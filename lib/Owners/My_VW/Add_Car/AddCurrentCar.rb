require 'json'
class AddCurrentCar < MyVW

  def visit
    visit_page(page_url)
  end

  def step_1_present?
    add_car_title.present?
  end

  def click_i_own_car_button
    car_i_own_button.when_present.click
  end

  def registration_field_present?
    registration_text_field.present?
  end

  def enter_registrations(registration)
    registration_text_field.set("#{registration}")
  end

  def error_message_present?
    error_message.present?
  end

  def enter_valid_registrations(registrations)
    registration_text_field.set("#{registrations}")
  end

  def click_registration_lookup_button
    registration_lookup_button.click
  end

  def found_car_text_present?
    found_car_message.present?
  end

  def step_1a_b
    registration_text_field.when_present.set("VX63NSN")
    registration_lookup_button.click
  end

  def click_used_car_button
    used_car_button.when_present.click
  end

  def enter_car_name
    my_car_name_input_box.set("TEST")
  end

  def continue_to_step_2
    goto_section2.when_present.click
  end

  def click_edit_link
    edit_my_car_details.when_present.click
  end

  def fill_in_car_details(day, month, year, engine_size)
    registration_month.option(:text => "#{month}").click
    registration_year.option(:value => "#{year}").click
    registration_date.option(:value => "#{day}").click
  end

  def search_by_postcode(postcode)
    retailer_location_search.set("#{postcode}")
  end

  def click_postcode_lookup_button
    retailer_location_lookup_button.click
  end

  def validate_postcode_field
    retailer_selection.wait_until_present
    if retailer_list.present?
      return false
    elsif error_message_retailer.present?
      return false
    else
      return true
    end
  end

  def search_by_retailer_name(retailer_name)
    retailer_name_search.set("#{retailer_name}")
  end

  def click_retailer_name
    select_retailer_name.click
  end

  def preferred_retailer_options_present?
    preferred_retailer_options.present?
  end

  def retailer_list_present?
    retailer_list.wait_until_present
  end

  def choose_my_retailer
    retailer_name_search.set("Hampstead")
    click_retailer_name
    retailer_list_present?
    serviced_by_button.click
  end

  def click_finish_button
    finish_button.click
  end

  def added_car_present?
    added_car.present?
  end

  def login_add_car_user_account
    get_add_car_user
    set_username.set("#{username_add_car_user}")
    set_password.set("#{password_add_car_user}")
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

  private

  def page_url
    "/owners/my/cars/add"
  end

  def my_car_menu
    @browser.ul(:class => "welcome-stripe__menu-list", :index => 1).li(:class => "welcome-stripe__menu-list-item")
  end

  def add_car_title
    @browser.h1(:class => "full-hero__title")
  end

  def car_i_own_button
    @browser.div(:id => "car-status-select").label(:for => "car-status-own")
  end

  def registration_text_field
    @browser.text_field(:id => "registration-number")
  end

  def registration_lookup_button
    @browser.button(:class => "js-registration-submit")
  end

  def found_car_message
    @browser.h3(:class => "my-car-form__editor-subtitle--black", :text => "We think we've found your car")
  end

  def error_message
    @browser.div(:class => "error-label")
  end

  def my_car_form
    @browser.div(:class => "my-car-form__window")
  end

  def edit_my_car_details
    @browser.div(:id => "car-detail-toggle")
  end

  def new_car_button
    @browser.div(:class => "radio__buttons").label(:for => "car-age-new")
  end

  def used_car_button
    @browser.div(:id => "car-details-step-1").label(:for => "car-age-used")
  end

  def my_car_name_input_box
    @browser.text_field(:id => "car-name")
  end

  def goto_section2
    @browser.button(:id => "goto-section-2")
  end

  def step_2_title
    @browser.span(:text => "2").text
  end

  def retailers_from_previous_car
    @browser.h3(:text => "From your other cars")
  end

  def retailer_location_search
    @browser.text_field(:id => "retailer-location-search")
  end

  def retailer_location_lookup_button
    @browser.button(:id => "retailer-location-search-submit")
  end

  def retailer_name_search
    @browser.text_field(:id => "retailer-name-search")
  end

  def finish_button
    @browser.button(:id => "submit-no-owner")
  end

  def registration_month
    @browser.select_list(:id => "registrationDate_month")
  end

  def registration_date
    @browser.select_list(:id => "registrationDate_day")
  end

  def registration_year
    @browser.select_list(:id => "registrationDate_year")
  end

  def engine_size_box
    @browser.text_field(:id => "details-engineCapacity")
  end

  def error_message_retailer
    @browser.div(:class => "js-preferred-retailers").div(:id => "retailer-selection").p(:class => "form-error")
  end

  def retailer_list
    @browser.div(:id => "retailer-list")
  end

  def retailer_selection
    @browser.div(:id => "retailer-selection")
  end

  def select_retailer_name
    @browser.ul(:id => "ui-id-2").li(:index => 0)
  end

  def preferred_retailer_options
    @browser.ul(:id => "retailer-group").li(:class => "retailer")
  end

  def finish_button
    @browser.button(:id => "submit-no-owner")
  end

  def serviced_by_button
    @browser.div(:class => "serviced-by").radio(:name => "servicedBy")
  end

  def added_car
    @browser.my_car_menu.div(:class => "my-cars-dropdown-cars").h2(:class => "my-cars-dropdown-car-detail-info__title", :text => "test")
  end

  def username_add_car_user
    @username_add_car_user
  end

  def password_add_car_user
    @password_add_car_user
  end

  def get_add_car_user
    user_data = File.read('users.json')
    users_hash = JSON.parse(user_data)
    @username_add_car_user = users_hash["User_accounts"]["Unvalid_users"][1]["Username"]
    @password_add_car_user = users_hash["User_accounts"]["Unvalid_users"][1]["Password"]
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

end

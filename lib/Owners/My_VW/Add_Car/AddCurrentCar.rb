require 'json'
class AddCurrentCar < MyVW

  def step_1.present?
    add_car_title.present?
  end

  def select_add_car
    my_car_menu.click
    add_car_link.when_present.click
  end

  def click_i_own_car_button
    car-status-own.when_present.click
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
    registration_text_field.set("VX63NSN")
  end

  def click_user_car_button
    user_car_buton.click
  end

  def enter_car_name
    my_car_name_input_box.set("TEST")
  end

  def continue_to_step_2
    goto_section2.click
  end

  def fill_in_car_details(day, month, year, engine_size)
    registration_month.option(:text => "#{month}").click
    registration_year.option(:value => "#{year}").click
    registration_date.option(:value => "#{day}").click
  end

  private

  def my_car_menu
    @browser.ul(:class => "welcome-stripe__menu-list", :index => 1).li(:class => "welcome-stripe__menu-list-item").a(:href => "#")
  end

  def add_car_link
    @browser.link(:href => "/owners/my/cars/add")
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
    @browser.div(:class => "radio_buttons").label(:for => "car-age-new")
  end

  def user_car_buton
    @browser.div(:class => "radio_buttons").label(:for => "car-age-used")
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
    @browsr.button(:id => "retailer-location-search-submit")
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

end










end

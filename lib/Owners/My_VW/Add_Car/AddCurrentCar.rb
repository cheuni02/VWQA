require 'json'
class AddCurrentCar < MyVW



  def step_1.present?
    add_car_title.present?
  end



  def add_car_type(buttons)
    @browser.div(:id => "car-status-select").label(:text => "#{buttons}").present?
  end

  private

  def add_car_title
    @browser.h1(:class => "full-hero__title")
  end

  def registration_text_field
    @browser.text_field(:id => "registration-number")
  end

  def registration_lookup_button
    @browser.button(:class => "js-registration-submit")
  end

  def found_car_message
    @browser.h3(:class => "my-car-form__editor-subtitle--black").text
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










end

require 'json'
class AddCurrentCar < MyVW






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










end

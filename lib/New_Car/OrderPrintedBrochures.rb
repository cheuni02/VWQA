class OrderPrintedBrochure < NewCars

  def visit(model)
    visit_page(page_url(model))
  end

  def page_title
    @browser.title
  end

  def order_brochure_car_model
    order_brochure_model_locator
  end

  def page_loaded?(page)
    case page
      when /(tell us).*/i
        order_tell_details.wait_until_present
        title_select_locator.present?
      when /(brochures? list).*/i
        order_brochure_list.wait_until_present
        selected_car_description.present?
      when /(confirmation).*/i
        order_brochure_confirmation.wait_until_present
        confirm_personal_details_locator.present?
    end
  end

  def select_brochures_header
    select_brochures_header_locator
  end

  def selected_car_description
    selected_car_description_locator
  end
  def add_current_brochure(status)
    status == '0' ? add_current_brochure_locator.clear : add_current_brochure_locator.set
  end

  def selected_car_img
    selected_car_img_locator
  end

  def next_button
    next_button_locator
  end

  def back_button_car_select
    back_button_locator
  end

  def another_brochures
    another_brochures_link_locator
  end

  def get_number_of_other_brochures
    number = another_brochures.text
    number = number.match(/.*(\d).*/)[1]
    number.to_i
  end

  def new_cars_section
    new_cars_section_locator
  end

  def new_cars
    new_cars_locator
  end

  def select_other_cars(number)
    unless number == ''
      for i in 1..number.to_i
        car = new_cars[i-1].checkbox
        car.set? ? true : car.set
      end
    end
  end

  def verify_new_cars_grid
    new_cars.each do |car|
      raise AssertionError, "The name of the car is not displayed" unless car.h4.present?
      raise AssertionError, 'The image of the car is not displayed' unless car.span.present?
      raise AssertionError, 'The car brochure and price list checkbox is not displayed' unless car.input.present?
    end
  end
#
# Order a brochures - Tell us about you
#
  def order_brochure_title
    order_brochure_title_locator
  end

  def selected_brochures
    selected_brochures_locator
  end

  def form_title
    form_title_locator
  end

  def select_title(title)
    unless title == ''
      title_select_locator.select(title)
    end
  end

  def first_name
    first_name_input_locator
  end

  def last_name
    last_name_input_locator
  end

  def email
    email_input_locator
  end

  def telephone
    telephone_input_locator
  end

  def house_name
    house_name_input_locator
  end

  def postcode
    postcode_input_locator
  end

  def find_postcode
    postcode_find_button_locator
  end

  def street_name
    street_name_input_locator
  end

  def street_name_second
    street_name_second_locator
  end

  def town_city
    town_city_input_locator
  end

  def county
    county_input_locator
  end

  def next_car_optional
    next_car_optional_locator
  end

  def select_next_car_purchase_month(month)
    unless month == ''
      next_car_purchase_month_locator.select(month)
    end
  end

  def select_next_car_purchase_year(year)
    unless year == ''
      next_car_purchase_year_locator.select(year)
    end
  end

  def select_next_car_type(type)
    unless type == ''
      next_car_type_locator(type).set
    end
  end

  def select_next_car_ownership(ownership)
    unless ownership == ''
      next_car_ownership_locator(ownership).set
    end
  end

  def current_car_optional
    current_car_optional_locator
  end

  def current_car_make
    current_car_make_locator
  end

  def current_car_model
    current_car_model_locator
  end

  def contact_email(email)
    email == 'yes' ? contact_email_locator.set : contact_email_locator.clear
  end

  def contact_telephone(telephone)
    telephone == 'yes' ? contact_telephone_locator.set : contact_telephone_locator.clear
  end

  def contact_text_msg(message)
    message == 'yes' ? contact_text_msg_locator.set : contact_text_msg_locator.clear
  end

  def contact_post(post)
    post == 'yes' ? contact_post_locator.set : contact_post_locator.clear
  end

  def contact_organisations(value)
    value == 'yes' ? contact_organisations_locator.set : contact_organisations_locator.clear
  end

  def privacy_policy
    privacy_policy_locator
  end

  def privacy_policy_content
    privacy_policy_content_locator
  end

  def back_button_form
    back_button_form_locator
  end

  def submit_button
    submit_button_locator
  end

  def error_messages
    error_messages_locator
  end
#
# Confirmation page
#
  def get_brochures_names(list)
    String brochures = Array.new
    list.each_with_index do |element, index|
      brochures[index] = element.text
    end
    brochures
  end

  def confirm_brochures
    confirm_brochures_locator
  end

  def confirm_brochures_main
    confirm_brochures_main_locator
  end

  def confirm_personal_details
    confirm_personal_details_locator
  end

  def confirm_print_button
    confirm_print_button_locator
  end

  def confirm_home_button
    confirm_home_button_locator
  end

  def book_test_drive_link
    book_test_drive_locator
  end

  def create_account_button
    create_account_locator
  end
  private
#
# Order a brochure page - select the cars the brochures are for
#
  def page_url(model)
    "/new/#{model}/which-model/brochures"
  end

  def order_brochure_list
    @browser.div(:id => 'brochureListWrap')
  end

  def order_brochure_model_locator
    @browser.span(:css => '.vw-btn.single-btn>.vw-icon-link')
  end

  def select_brochures_header_locator
    @browser.span(:css => '#wide-container .headlineBlue>span')
  end

  def selected_car_description_locator
    @browser.div(:css => '.selectedBrochureIntro')
  end
  def add_current_brochure_locator
    @browser.checkbox(:css => ".selectedBrochureIntro [name='brochures']")
  end

  def selected_car_img_locator
    @browser.img(:css => '.selectedCarDownload>img')
  end

  def next_button_locator
    @browser.button(:id => 'nextButton')
  end

  def back_button_locator
    @browser.link(:id => 'backButton')
  end

  def another_brochures_link_locator
    @browser.p(:id => 'brochures-remaining').em
  end

  def new_cars_section_locator
    @browser.ul(:id => 'new-cars')
  end
  def new_cars_locator
    new_cars_section_locator.lis(:css => '#new-cars>li')
  end
#------------------------------------------------------------------
# Order a brochure - Tell us about you
#
  def order_brochure_title_locator
    @browser.span(:css => '#bookingContactIntro .headlineBlue>span')
  end

  def order_tell_details
    @browser.div(:id => 'bookingDetails')
  end
  def selected_brochures_locator
    @browser.lis(:css => '.selectedCarPost>li')
  end

  def form_title_locator
    @browser.h3(:css => '#bookingDetails h3.rttd')
  end

  def title_select_locator
    @browser.select(:id => 'title')
  end

  def first_name_input_locator
    @browser.text_field(:id => 'firstName')
  end

  def last_name_input_locator
    @browser.text_field(:id => 'lastName')
  end

  def email_input_locator
    @browser.text_field(:id => 'email')
  end

  def telephone_input_locator
    @browser.text_field(:id => 'phone')
  end

  def house_name_input_locator
    @browser.text_field(:id => 'houseNumber')
  end

  def postcode_input_locator
    @browser.text_field(:id => 'postcode')
  end

  def postcode_find_button_locator
    @browser.button(:css => '#findAddressDiv>a')
  end

  def street_name_input_locator
    @browser.text_field(:id => 'street')
  end

  def street_name_second_locator
    @browser.text_field(:id => 'street2')
  end

  def town_city_input_locator
    @browser.text_field(:id => 'city')
  end

  def county_input_locator
    @browser.text_field(:id => 'county')
  end

  def next_car_optional_locator
    @browser.div(:css => '.brochureOptionals', :index => 0)
  end

  def next_car_purchase_month_locator
    @browser.select(:id => 'nextCarPurchaseMonth')
  end

  def next_car_purchase_year_locator
    @browser.select(:id => 'nextCarPurchaseYear')
  end

  def next_car_type_locator(type)
    @browser.radio(:id => 'nextCarPurchaseType', :value => /#{type}/i)
  end

  def next_car_ownership_locator(ownership)
    @browser.radio(:id => 'nextCarOwnership', :value => /#{ownership}/i)
  end

  def current_car_optional_locator
    @browser.div(:css => '.brochureOptionals', :index => 1)
  end

  def current_car_make_locator
    @browser.text_field(:id => 'currentMake')
  end

  def current_car_model_locator
    @browser.text_field(:id => 'currentModel')
  end

  def contact_email_locator
    @browser.checkbox(:id => 'email-opt-in')
  end

  def contact_telephone_locator
    @browser.checkbox(:id => 'phone-opt-in')
  end

  def contact_text_msg_locator
    @browser.checkbox(:id => 'text-msg-opt-in')
  end

  def contact_post_locator
    @browser.checkbox(:id => 'post-opt-in')
  end

  def contact_organisations_locator
    @browser.checkbox(:id => 'optInThirdParty')
  end

  def privacy_policy_locator
    @browser.link(:class => 'show-pop-up-content')
  end

  def privacy_policy_content_locator
    @browser.div(:class => 'privacy-content')
  end

  def submit_button_locator
    @browser.button(:id => 'submitForm')
  end

  def back_button_form_locator
    @browser.button(:id => 'backButton')
  end

  def error_messages_locator
    @browser.p(:class => 'error')
  end
#
# Confirmation page
#

  def order_brochure_confirmation
    @browser.div(:id => 'confirmation')
  end
  def confirm_brochures_locator
    @browser.lis(:css => '#bookingContactIntro .selectedCarPost>li')
  end

  def confirm_brochures_main_locator
    @browser.lis(:css => '.confirmation-box>.selectedCarPost>li')
  end

  def confirm_personal_details_locator
    @browser.address(:css => 'address')
  end

  def confirm_print_button_locator
    @browser.link(:css => '#print>a')
  end

  def confirm_home_button_locator
    @browser.link(:css => '#home>a')
  end

  def book_test_drive_locator
    @browser.link(:css => '.button-test-drive')
  end

  def create_account_locator
    @browser.button(:css => '.vw-btn.vw-btn-registration')
  end

end
require 'json'
class AddCurrentCar < MyVW
  def visit
    visit_page(page_url)
  end

  def success_message
    @browser.element(id: 'car-detail-text')
  end

  def searched_car_reg
    success_message.li(index: 0).span(index: 1)
  end

  def searched_car_model
    success_message.li(index: 1).span(index: 1)
  end

  def searched_car_detail
    success_message.li(index: 2).span(index: 1)
  end

  def car_age_new
    @browser.radio(id: 'car-age-new')
  end

  def car_age_used
    @browser.radio(id: 'car-age-used')
  end

  def edit_car_form
    @browser.element(id: 'car-detail-edit')
  end

  def add_a_car_choices
    @browser.element(id: 'add-car-main')
  end

  def car_i_own_radio
    @browser.radio(id: 'car-status-own')
  end

  def car_i_ordered_radio
    @browser.radio(id: 'car-status-ordered')
  end

  def car_i_configured_radio
    @browser.radio(id: 'car-status-configured')
  end

  def add_a_car_options(options)
    missing_option = []
    case options
    when /A car I own/
      missing_option << 'A car I own' unless car_i_own_radio.exists?
    when /A car I ordered/
      missing_option << 'A car I ordered' unless car_i_ordered_radio.exists?
    when /A configured car/
      missing_option << 'A configured car' unless car_i_configured_radio.exists?
    end
    missing_option
  end

  def reg_lookup_button
    @browser.element(id: 'button-regLookup-submit')
  end

  def error_message
    @browser.div(class: 'error-label')
  end

  def page_url
    '/owners/my/cars/add'
  end

  def fuel_type_petrol_radio
    @browser.radio(id: 'fuel-petrol')
  end

  def fuel_type_diesel_radio
    @browser.radio(id: 'fuel-diesel')
  end

  def fuel_type_hybrid_radio
    @browser.radio(id: 'fuel-hybrid')
  end

  def fuel_type_electric_radio
    @browser.radio(id: 'fuel-electric')
  end

  def fuel_type_petrol
    @browser.elements(class: 'radio__buttons')[1].element(text: 'Petrol')
  end

  def fuel_type_diesel
    @browser.elements(class: 'radio__buttons')[1].element(text: 'Diesel')
  end

  def fuel_type_hybrid
    @browser.elements(class: 'radio__buttons')[1].element(text: 'Hybrid')
  end

  def fuel_type_electric
    @browser.elements(class: 'radio__buttons')[1].element(text: 'Electric')
  end

  def transmission_manual_radio
    @browser.radio(id: 'transmission-manual')
  end

  def transmission_automatic_radio
    @browser.radio(id: 'transmission-automatic')
  end

  def transmission_manual
    @browser.elements(class: 'radio__buttons')[2].element(text: 'Manual')
  end

  def transmission_automatic
    @browser.elements(class: 'radio__buttons')[2].element(text: 'Automatic')
  end

  def step_1_summary
    @browser.element(class: 'my-car-form__text')
  end

  def step_1_summary_reg
    step_1_summary.li(index: 0).span(index: 1)
  end

  def step_1_summary_model
    step_1_summary.li(index: 1).span(index: 1)
  end

  def step_1_summary_details
    step_1_summary.li(index: 2).span(index: 1)
  end

  def step_1_summary_acquired_as
    step_1_summary.li(index: 3).text.match(/\:(.*)[a-zA-Z0-9]/).to_s.gsub(':  ', '')
  end

  def step_1_summary_car_name
    step_1_summary.li(index: 4).text.match(/\:(.*)[a-zA-Z0-9]/).to_s.gsub(':  ', '')
  end

  def car_i_own_button
    @browser.div(id: 'car-status-select').label(for: 'car-status-own')
  end

  def car_i_ordered_button
    @browser.div(id: 'car-status-select').label(for: 'car-status-ordered')
  end

  def car_configured_button
    @browser.div(id: 'car-status-select').label(for: 'car-status-configured')
  end

  def max_car_limit
    @browser.element(id: 'no-more-cars-dialog')
  end

  def max_car_limit_button
    @browser.button(class: 'my-vw-button my-vw-button--blue my-overlay__no-more-cars-button')
  end

  def registration_text_field
    @browser.text_field(id: 'registration-number')
  end

  def edit_my_car_details
    @browser.div(id: 'car-detail-toggle')
  end

  def details_registration_number
    @browser.element(id: 'details-registration-number')
  end

  def model_field
    @browser.text_field(id: 'details-model')
  end

  def derivative_field
    @browser.text_field(id: 'details-derivative')
  end

  def year_manufacture_options(year)
    return false if year.empty?
    @browser.button(class: 'ui-button my-selectbox__button ui-combobox-button').when_present.click
    @browser.li(text: year).click
  end

  def year_manufacture
    @browser.element(class: 'my-selectbox__input')
  end

  def my_car_name_input_box
    @browser.text_field(id: 'car-name')
  end

  def car_name_validation_message
    @browser.element(xpath: "//*[@id='car-details-step-1']/div[4]/div/div/div/p")
  end

  def my_car_details_errors
    @browser.element(id: 'car-detail-edit-error-sum')
  end

  def goto_section2
    @browser.button(id: 'goto-section-2')
  end

  def retailer_location_search
    @browser.text_field(id: 'retailer-location-search')
  end

  def retailer_name_search
    @browser.text_field(id: 'retailer-name-search')
  end

  def engine_size_field
    @browser.text_field(id: 'details-engineCapacity')
  end

  def reg_input
    @browser.input(id: 'registration-number')
  end

  def preselected_retailer
    @browser.element(class: 'radio__list')
  end

  def preselected_retailer_radio
    preselected_retailer.radio(index: 0)
  end

  def change_section_1
    @browser.button(id: 'change-section-1')
  end
end

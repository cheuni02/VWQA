require 'json'
class AddCurrentCarStep1 < MyVW
  def go_to_section_2
    @browser.element(id: 'goto-section-2')
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

  def car_i_own_button
    @browser.div(id: 'car-status-select').label(for: 'car-status-own')
  end

  def car_i_ordered_button
    @browser.div(id: 'car-status-select').label(for: 'car-status-ordered')
  end

  def car_configured_button
    @browser.div(id: 'car-status-select').label(for: 'car-status-configured')
  end

  def registration_text_field
    @browser.text_field(id: 'registration-number')
  end

  def max_car_limit
    @browser.element(id: 'no-more-cars-dialog')
  end

  def max_car_limit_button
    @browser.button(class: 'my-vw-button my-vw-button--blue my-overlay__no-more-cars-button')
  end

  def reg_lookup_button
    @browser.element(id: 'button-regLookup-submit')
  end

  def error_message
    @browser.div(class: 'error-label')
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

  def edit_car_form
    @browser.element(id: 'car-detail-edit')
  end

  def car_form_fields_empty(field)
    fields = []
    case field
    when /Model/
      fields << 'Model field contains ' + model_field.value unless model_field.value.empty?
    when /Trim/
      fields << 'Trim field contains ' + derivative_field.value unless derivative_field.value.empty?
    when /Date of registration/
      fields << 'Date of registration day field contains ' + date_registered_day.value unless date_registered_day.value.empty?
      fields << 'Date of registration month field contains ' + date_registered_month.value unless date_registered_month.value.empty?
      fields << 'Date of registration year field contains ' + date_registered_year.value unless date_registered_year.value.empty?
    when /Year of manufacture/
      fields << 'Year of manufacture field contains ' + year_manufacture.value unless year_manufacture.value.empty?
    when /Engine size/
      fields << 'Engine size field contains ' + engine_size_field.value unless engine_size_field.value.empty?
    when /I'd like to call my car/
      fields << "I'd like to call my car field contains " + my_car_name_field.value unless my_car_name_field.value.empty?
    end
    fields
  end

  def car_form_options(radios)
    options = []
    case radios
    when /Fuel type /
      options << 'Fuel type Petrol is set' if fuel_type_petrol_radio.set?
      options << 'Fuel type Diesel is set' if fuel_type_diesel_radio.set?
      options << 'Fuel type Hybrid is set' if fuel_type_hybrid_radio.set?
      options << 'Fuel type Electric is set' if fuel_type_electric_radio.set?
    when /Transmission/
      options << 'Transmission type Manual is set' if transmission_manual_radio.set?
      options << 'Transmission type Automatic is set' if transmission_automatic_radio.set?
    end
    options
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

  def transmission_manual_radio
    @browser.radio(id: 'transmission-manual')
  end

  def transmission_automatic_radio
    @browser.radio(id: 'transmission-automatic')
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

  def date_registered_day
    @browser.element(id: 'details-registrationDate_day')
  end

  def clear_date_picker_field(field_object)
    field_object.when_present.send_keys(:backspace) until field_object.value.empty?
  end

  def clear_date_registered_day
    clear_date_picker_field(date_registered_day)
  end

  def date_registered_month
    @browser.element(id: 'details-registrationDate_month')
  end

  def clear_date_registered_month
    clear_date_picker_field(date_registered_month)
  end

  def date_registered_year
    @browser.element(id: 'details-registrationDate_year')
  end

  def clear_date_registered_year
    clear_date_picker_field(date_registered_year)
  end

  def my_car_name_field
    @browser.text_field(id: 'car-name')
  end

  def car_name_validation_message
    @browser.element(xpath: "//*[@id='car-details-step-1']/div[4]/div/div/div/p")
  end

  def my_car_details_errors
    @browser.element(id: 'car-detail-edit-error-sum')
  end

  def car_age_new
    @browser.radio(id: 'car-age-new')
  end

  def car_age_used
    @browser.radio(id: 'car-age-used')
  end

  def edit_my_car_details
    @browser.div(id: 'car-detail-toggle')
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

  def transmission_manual
    @browser.elements(class: 'radio__buttons')[2].element(text: 'Manual')
  end

  def transmission_automatic
    @browser.elements(class: 'radio__buttons')[2].element(text: 'Automatic')
  end

  def date_picker
    @browser.element(id: 'registrationDate-datepicker-trigger')
  end

  def date_picker_years
    @browser.element(class: 'datepicker-years')
  end

  def date_picker_current_year_range
    date_picker_years.element(class: 'datepicker-switch')
  end

  def go_back_to_year_range(range)
    date_picker_years.element(class: 'chevron', index: 0).when_present.click until date_picker_current_year_range.text == range
  end

  def check_years_range
    years = []
    12.times { |i| years << date_picker_years.span(class: 'year', index: i).text }
    years
  end

  def year_of_registration(year)
    date_picker_years.span(class: 'year', text: year)
  end

  def date_picker_month
    @browser.element(class: 'datepicker-months')
  end

  def date_picker_current_year
    date_picker_month.element(class: 'datepicker-switch')
  end

  def check_months_range
    months = []
    12.times { |i| months << date_picker_month.span(class: 'month', index: i).text }
    months
  end

  def month_of_registration(month)
    date_picker_month.span(class: 'month', text: month)
  end

  def date_picker_days
    @browser.element(class: 'datepicker-days')
  end

  def date_picker_current_month
    date_picker_days.element(class: 'datepicker-switch')
  end

  def check_month_days_range
    date_picker_days.elements(class: /^day$/)
  end

  def day_of_registration(day)
    date_picker_days.td(class: /^day$/, text: day)
  end

  def details_registration_number
    @browser.element(id: 'details-registration-number')
  end

  def engine_size_field
    @browser.text_field(id: 'details-engineCapacity')
  end
end

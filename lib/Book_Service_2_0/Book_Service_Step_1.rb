class BookAService2Step1 < BookAService2
  def page_loaded?
    car_details_edit_panel.wait_until_present
  end

  def click_step_2_button
    step2_button.when_present.click
    Watir::Wait.while { loading_wheel.visible? }
  end

  def car_trim_details
    car_details_section.li(index: 0).span(index: 0).text
  end

  def car_year_made_details
    car_details_section.li(index: 0).span(index: 1).text
  end

  def car_reg_details
    car_details_section.li(index: 1).text
  end

  def engine_size_details
    car_details_section.li(index: 2).span(index: 0).text
  end

  def fuel_type_details
    car_details_section.li(index: 2).span(index: 1).text
  end

  def transmission_details
    car_details_section.li(index: 2).span(index: 2).text
  end

  def car_details_section
    @browser.element(id: 'carDetailsEditLeft-viewer')
  end

  def edit_user_car_details
    @browser.element(id: 'changeTo_carDetailsEditLeft-editor')
  end

  def registration_lookup
    @browser.button(id: 'button-regLookup-submit')
  end

  def set_manual_transmission
    @browser.elements(class: 'radio__buttons')[0].element(text: 'Manual')
  end

  def set_auto_transmission
    @browser.elements(class: 'radio__buttons')[0].element(text: 'Automatic')
  end

  def set_fuel_petrol
    @browser.elements(class: 'radio__buttons')[1].element(text: 'Petrol')
  end

  def set_fuel_diesel
    @browser.elements(class: 'radio__buttons')[1].element(text: 'Diesel')
  end

  def registration_error_more_info
    @browser.element(id: 'carDetailsEditRight-editor').element(class: 'my-car-form__errors')
  end

  def loading_wheel
    @browser.div(id: 'page').div(class: 'my-loading-shield')
  end

  def car_details_edit_panel
    @browser.div(id: 'carDetailsEditLeft')
  end

  def mileage_field
    @browser.text_field(id: 'approximate-mileage')
  end

  def step2_button
    @browser.button(id: 'goto-myDetails')
  end

  def interested_in_plan_label
    @browser.label(for: 'wantServicePlan')
  end

  def service_plan_label
    @browser.label(for: 'hasServicePlan')
  end

  def warranty_label
    @browser.label(for: 'hasWarranty')
  end

  def leased_car_label
    @browser.label(for: 'isLeased')
  end

  def leased_car_field
    @browser.text_field(id: 'leaseCompany')
  end

  def registration_lookup_button
    @browser.button(id: 'button-regLookup')
  end

  def model_field
    @browser.text_field(id: 'model')
  end

  def trim_field
    @browser.text_field(id: 'trim')
  end

  def engine_size_field
    @browser.text_field(id: 'engineCapacity')
  end

  def year_made_field
    @browser.text_field(id: 'year')
  end

  def registration_field
    @browser.text_field(id: 'registration-numberSB')
  end

  def registration_error_box
    @browser.element(id: 'carDetailsEditLeft-editor').element(class: 'my-car-form__errors')
  end

  def edit_car_details_form
    @browser.element(id: 'editCarDetails-body')
  end

  def select_car_button
    @browser.button(id: 'button-selectCar')
  end

  def derivative_name_field
    @browser.text_field(id: 'derivative')
  end

  def manual_transmission_radio
    @browser.radio(id: 'car-transmission-manual')
  end

  def auto_transmission_radio
    @browser.radio(id: 'car-transmission-automatic')
  end

  def fuel_petrol_radio
    @browser.radio(id: 'car-fuel-petrol')
  end

  def fuel_diesel_radio
    @browser.radio(id: 'car-fuel-diesel')
  end

  def select_vehicle_list(vehicle)
    @browser.button(class: 'ui-button my-selectbox__button ui-combobox-button').click
    @browser.li(text: vehicle).click
  end

  def search_for_another_car_button
    @browser.button(id: 'button-regLookup')
  end

  def select_from_my_cars_button
    @browser.button(id: 'button-selectCar')
  end
end

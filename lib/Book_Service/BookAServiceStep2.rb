class BookAServiceStep2 < BookAService
  def page_loaded?
    car_registration_field.present?
  end

  def set_registration(registration)
    car_registration_field.set(registration)
  end

  def submit_car_registration
    car_registration_button.when_present.click
  end

  def get_car_details
    details = []
    details[0] = car_model.value
    details[1] = car_derivitive.value
    details[2] = car_engine.value
    details[3] = car_manufacture_year.value

    details
  end

  def set_manual_details_present?
    manual_details_button.present?
  end

  def set_mileage(mileage)
    car_mileage.set(mileage)
  end

  def click_change_details
    manual_details_button.click
  end

  def car_model_disabled?
    car_model.disabled?
  end

  def set_car_model(model)
    car_model.select(/#{model}/i)
  end

  def set_leased_car
    leased_car_radio.click
  end

  def lease_company_field_present?
    lease_company_field.when_present(15)
  end

  def set_lease_company(company)
    lease_company_field.when_present.set(company)
  end

  def set_car_derivative(derivative)
    car_derivitive.set(derivative)
  end

  def set_car_engine(engine_size)
    car_engine.set(engine_size)
  end

  def set_car_manufacture_year(year)
    car_manufacture_year.set(year)
  end

  def set_transmission_auto
    transmission_auto_radio.set
  end

  def set_transmission_manual
    transmission_manual_radio.set
  end

  def set_fuel_petrol
    fuel_type_petrol_radio.set
  end

  def set_fuel_diesel
    fuel_type_diesel_radio.set
  end

  def jot_engine_size
    engine_capacity
  end

  def visit
    visit_page(page_url)
  end

  private

  def page_url
    '/owners/service-booking/chooseRetailer?requiresDOB=false&collection=false&delivery=false&optInEmail=true&optInPhone=true&optInPost=true&optInText=true&optInThirdParty=true&pc=Uxbridge'
  end

  def car_registration_field
    @browser.text_field(id: 'registration-number')
  end

  def car_registration_button
    @browser.button(name: '_action_registration')
  end

  def car_model
    @browser.select(id: 'model')
  end

  def car_derivitive
    @browser.text_field(id: 'derivative')
  end

  def car_engine
    @browser.text_field(id: 'engineCapacity')
  end

  def car_manufacture_year
    @browser.text_field(id: 'year')
  end

  def manual_details_button
    @browser.button(class: 'btn-manual')
  end

  def car_mileage
    @browser.text_field(id: 'mileage')
  end

  def leased_car_radio
    @browser.radio(id: 'isLeased-yes')
  end

  def lease_company_field
    @browser.text_field(id: 'leaseCompany')
  end

  def transmission_auto_radio
    @browser.radio(id: 'transmission-automatic')
  end

  def transmission_manual_radio
    @browser.radio(id: 'transmission-manual')
  end

  def fuel_type_petrol_radio
    @browser.radio(id: 'transmission-petrol')
  end

  def fuel_type_diesel_radio
    @browser.radio(id: 'transmission-diesel')
  end

  def engine_capacity
    @browser.text_field(id: "engineCapacity").value
  end
end

class BookAService2Step2 < BookAService2
  def page_loaded?
    personal_details_panel.wait_until_present
  end

  def enter_personal_details(first_name, last_name, mobile, email)
    first_name_field.set(first_name)
    last_name_field.set(last_name)
    mobile_field.set(mobile)
    email_field.set(email)
  end

  def enter_address_details(house_no, postcode, address_line1, city)
    house_no_field.set(house_no)
    address_line_1_field.set(address_line1)
    city_field.set(city)
    postcode_field.set(postcode)
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

  def service_plan_summary
    more_info_section.li(index: 0).p.text
  end

  def extended_warranty_summary
    more_info_section.li(index: 1).p.text
  end

  def leased_with_summary
    more_info_section.li(index: 2).p.text
  end

  def update_car_details
    @browser.button(id: 'change-carDetails')
  end

  def service_plan_info
    car_details_panel_right.li(id: 'myCarDetailsDerivative')
  end

  def car_details_panel_right
    @browser.div(id: 'carDetailsViewRight')
  end

  def more_info_section
    @browser.element(class: 'car-more-info-data')
  end

  def car_details_section
    @browser.element(class: 'car-details-data')
  end

  def personal_details_panel
    @browser.div(id: 'myDetailsEditLeft')
  end

  def address_details_panel
    @browser.div(id: 'myDetailsEditRight')
  end

  def select_title(title)
    case title
    when /Mr/
      title_list(0)
    when /Mrs/
      title_list(1)
    when /Miss/
      title_list(2)
    when /Ms/
      title_list(3)
    when /Dr/
      title_list(4)
    when /Prof/
      title_list(5)
    when /Lord/
      title_list(6)
    when /Lady/
      title_list(7)
    when /Sir/
      title_list(8)
    end
  end

  def title_list(index)
    @browser.button(class: 'ui-button my-selectbox__button ui-combobox-button').click
    @browser.element(id: 'ui-id-1').li(index: index).click
  end

  def first_name_field
    @browser.text_field(id: 'firstName')
  end

  def last_name_field
    @browser.text_field(id: 'lastName')
  end

  def mobile_field
    @browser.text_field(id: 'phoneNumber')
  end

  def email_field
    @browser.text_field(id: 'emailAddress')
  end

  def house_no_field
    @browser.text_field(id: 'houseNumber')
  end

  def address_line_1_field
    @browser.text_field(id: 'address1')
  end

  def city_field
    @browser.text_field(id: 'city')
  end

  def county_field
    @browser.text_field(id: 'county')
  end

  def postcode_field
    @browser.text_field(id: 'postcode')
  end

  def postcode_lookup
    @browser.button(id: 'postcode-lookup')
  end

  def step3_button
    @browser.button(id: 'goto-retailer')
  end

  def personal_details_errors
    @browser.element(id: 'myDetailsEditLeft-editor').element(class: 'my-car-form__errors')
  end

  def address_errors
    @browser.element(id: 'myDetailsEditRight-editor').element(class: 'my-car-form__errors')
  end
end

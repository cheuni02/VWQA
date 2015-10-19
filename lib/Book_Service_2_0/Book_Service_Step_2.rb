class BookAService2Step2 < BookAService2

  def page_loaded?
    personal_details_panel.wait_until_present
  end

  def get_service_plan_info
    service_plan_info.value
  end

  def car_details_section_present?
    car_details_section.present?
  end

  def click_edit_links
    edit_personal_details_link.click
    edit_address_details_link.click
  end

  def click_edit_personal_details_link
    edit_personal_details_link.click
  end

  def personal_details_populated?
    if ((first_name_field.value.empty?) || (last_name_field.value.empty?) || (email_field.value.empty?))
      return true
    else
      return false
    end
  end

  def click_edit_address_details
    edit_address_details_link.click
  end

  def address_details_populated?
    address_fields = [house_no_field.value, address_line_1_field.value, city_field.value, county_field.value]
    address_fields.each do |field|
      if field.empty?
        return true
      else
        return false
      end
    end
  end

  def do_step_2
    page_loaded?
    click_edit_links
    enter_my_personal_details
    enter_my_address_details
    click_step3_button
  end

  def enter_personal_details(first_name, last_name, mobile, email)
    first_name_field.set("#{first_name}")
    last_name_field.set("#{last_name}")
    mobile_field.set("#{mobile}")
    email_field.set("#{email}")
  end

  def enter_my_personal_details
    first_name_field.set("Test")
    last_name_field.set("Test")
    mobile_field.set("07912345673")
    email_field.set("tribaltester@outlook.com")
  end

  def enter_address_details(house_no, postcode, address_line1, city)
    house_no_field.set("#{house_no}")
    address_line_1_field.set("#{address_line1}")
    city_field.set("#{city}")
    county_field.set("#{postcode}")
  end

  def enter_my_address_details
    house_no_field.set("12")
    address_line_1_field.set("Bishops Bridge Road")
    city_field.set("London")
    postcode_field.set("W2 6AA")
  end

  def click_step3_button
    step3_button.when_present.click
  end

  private

  def service_plan_info
    car_details_panel_right.li(:id => "myCarDetailsDerivative")
  end

  def car_details_panel_right
    @browser.div(:id => "carDetailsViewRight")
  end

  def car_details_section
    @browser.section(:id => "sb-carDetails-section")
  end

  def personal_details_panel
    @browser.div(:id => "myDetailsEditLeft")
  end

  def address_details_panel
    @browser.div(:id => "myDetailsEditRight")
  end

  def edit_personal_details_link
    personal_details_panel.span(:class => "fa-edit")
  end

  def edit_address_details_link
    address_details_panel.span(:class => "fa-edit")
  end

  def first_name_field
    @browser.text_field(:id => "firstName")
  end

  def last_name_field
    @browser.text_field(:id => "lastName")
  end

  def mobile_field
    @browser.text_field(:id => "phoneNumber")
  end

  def email_field
    @browser.text_field(:id => "emailAddress")
  end

  def house_no_field
    @browser.text_field(:id => "houseNumber")
  end

  def address_line_1_field
    @browser.text_field(:id => "address1")
  end

  def city_field
    @browser.text_field(:id => "city")
  end

  def postcode_field
    @browser.text_field(:id => "postcode")
  end

  def step3_button
    @browser.button(:id => "goto-retailer")
  end
end

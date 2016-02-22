require 'json'
class AddCurrentCarStep3 < MyVW
  def step_2_summary
    @browser.element(id: 'section-2-text')
  end

  def step_2_retailer_name
    step_2_summary.li(class: 'summaryName')
  end

  def step_2_retailer_telephone
    step_2_summary.li(class: 'summaryPhone')
  end

  def step_2_retailer_email
    step_2_summary.li(class: 'summaryEmail')
  end

  def owner_address_field_values(field, value)
    field_values = []
    value = '' if value == 'empty'
    case field
    when 'Postcode'
      field_values << 'Postcode contains ' + owner_postcode.value + ' expected ' + value unless owner_postcode.value == value
    when 'House Name / no'
      field_values << 'House Name contains ' + owner_house_number.value + ' expected ' + value unless owner_house_number.value == value
    when 'Address 1'
      field_values << 'Address 1 contains ' + owner_address_1.value + ' expected ' + value unless owner_address_1.value == value
    when 'Address 2'
      field_values << 'Address 2 contains ' + owner_address_2.value + ' expected ' + value unless owner_address_2.value == value
    when 'Town / City'
      field_values << 'City contains ' + owner_city.value + ' expected ' + value unless owner_city.value == value
    when 'County'
      field_values << 'County contains ' + owner_county.value + ' expected ' + value unless owner_county.value == value
    end
    field_values
  end

  def owner_postcode
    @browser.text_field(id: 'owner-postcode')
  end

  def owner_house_number
    @browser.text_field(id: 'owner-houseNumber')
  end

  def owner_address_1
    @browser.text_field(id: 'owner-address1')
  end

  def owner_address_2
    @browser.text_field(id: 'owner-address2')
  end

  def owner_city
    @browser.text_field(id: 'owner-city')
  end

  def owner_county
    @browser.text_field(id: 'owner-county')
  end

  def owner_postcode_lookup
    @browser.element(class: 'postcode-lookup-submit')
  end

  def error_pop_up
    @browser.div(id: 'dbg-error-dialog')
  end

  def error_pop_up_button
    error_pop_up.button(class: 'my-vw-button')
  end

  def owner_address_error_feedback
    @browser.element(id: 'owner-edit-error-sum')
  end

  def step_3_finish_button
    @browser.button(id: 'submit-sections-123')
  end

  def step_3_skip_finish_button
    @browser.button(id: 'submit-sections-12')
  end

  def label_for_field(field)
    @browser.element(id: 'section-3-edit').div(class: 'my-input', text: /#{field}/).text
  end

  def change_step_2
    @browser.button(id: 'change-section-2')
  end

  def car_id
    @browser.url.split('/').last
  end

  def my_car_added
    @browser.element(class: 'full-hero__body')
  end

  def my_retailer_in_summary
    @browser.element(class: 'my-retailer__address')
  end

  def my_retailer_name
    my_retailer_in_summary.div(class: 'org')
  end
end

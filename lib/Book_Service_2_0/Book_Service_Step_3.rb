class BookAService2Step3 < BookAService2
  def page_loaded?
    retailer_section.wait_until_present
  end

  def summary_title
    personal_details_summary.li(index: 0).span(index: 0)
  end

  def summary_name
    personal_details_summary.li(index: 0).span(index: 1)
  end

  def summary_surname
    personal_details_summary.li(index: 0).span(index: 2)
  end

  def summary_mobile
    personal_details_summary.li(index: 1)
  end

  def summary_email
    personal_details_summary.li(index: 2)
  end

  def personal_details_summary
    @browser.element(class: 'my-details-personal-data')
  end

  def summary_house_number
    address_summary.li(index: 0)
  end

  def summary_street
    address_summary.li(index: 1)
  end

  def summary_town
    address_summary.li(index: 3)
  end

  def summary_postcode
    address_summary.li(index: 5)
  end

  def address_summary
    @browser.element(class: 'my-details-address-data')
  end

  def retailer_section
    @browser.section(id: 'sb-retailer-section')
  end

  def search_by_location_field
    @browser.text_field(id: 'retailer-location-search')
  end

  def location_lookup_button
    @browser.button(id: 'retailer-location-search-submit')
  end

  def search_by_name_field
    @browser.text_field(id: 'retailer-name-search')
  end

  def retailer_in_list(position)
    retailer_dropdown.element(class: 'ui-corner-all', index: position)
  end

  def retailer_dropdown
    @browser.ul(id: 'ui-id-3')
  end

  def retailer_error_message
    @browser.div(id: 'retailer-selection').p(class: 'form-error')
  end

  def local_retailer(position)
    @browser.element(id: 'retailer-group').element(class: 'retailer', index: position)
  end

  def selected_retailer
    @browser.element(id: 'retailer-list').li(class: 'retailer selected')
  end

  def loading_wheel
    @browser.div(id: 'page').div(class: 'my-loading-shield')
  end

  def step4_button
    @browser.button(id: 'goto-work')
  end

  def retailer_form_errors
    @browser.element(id: 'retailerEditLeft-editor').element(class: 'my-car-form__errors')
  end

  def retailer_group_list
    @browser.element(id: 'retailer-group')
  end

  def current_selected_retailer
    retailer_group_list.element(class: 'retailer').h4
  end

  def number_of_retailers_in_list
    list_length = 0
    loop do
      list_length += 1
      break if retailer_group_list.li(class: 'retailer', index: list_length).present? == false
    end
    list_length
  end
end

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
    if @browser.element(id: 'myDetailsEditLeft').text.empty?
      @browser.element(id: 'myDetailsViewLeft')
    else
      @browser.element(id: 'myDetailsEditLeft')
    end
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
    if @browser.element(id: 'myDetailsEditRight').text.empty?
      @browser.element(id: 'myDetailsViewRight')
    else
      @browser.element(id: 'myDetailsEditRight')
    end
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
    @browser.element(id: 'retailer-lookup-error')
  end

  def local_retailer(position)
    retailer_group_list.element(class: 'radio__list-cell', index: position)
  end

  def selected_retailer
    i = 0
    loop do
      i += 1
      break if retailer_group_list.element(class: 'radio__list-cell', index: i).h3.style('color') == 'rgba(0, 177, 235, 1)' || i == 10
    end
    retailer_group_list.element(class: 'radio__list-cell', index: i)
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
    @browser.element(id: 'searched-retailers-list')
  end

  def number_of_retailers_in_list
    list_length = 0
    loop do
      list_length += 1
      break if retailer_group_list.element(class: 'radio__list-cell', index: list_length).present? == false || list_length == 10
    end
    list_length
  end

  def edit_personal_button
    @browser.element(id: 'changeTo_myDetailsEditLeft-editor')
  end

  def edit_address_button
    @browser.element(id: 'changeTo_myDetailsEditRight-editor')
  end

  def map_tab
    @browser.element(text: 'Map')
  end

  def retailer_map
    @browser.element(id: 'searched-retailers-map')
  end

  def pin_on_map_latitude
    @browser.image(class: 'searched-retailer-map').src.split('|')[2].split(',')[0]
  end

  def pin_on_map_longitude
    @browser.image(class: 'searched-retailer-map').src.split('|')[2].split(',')[1]
  end

  def saved_retailer
    @browser.element(id: 'retailerEditLeft-viewer').element(class: 'my-car-form__summary')
  end

  def saved_retailer_name
    saved_retailer.li(index: 1)
  end

  def edit_saved_retailer
    @browser.element(id: 'changeTo_retailerEditLeft-editor')
  end

  def preferred_retailer_name
    @browser.element(id: 'preferred-retailer')
  end
end

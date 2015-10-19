class BookAService2Step3 < BookAService2

  def page_loaded?
    retailer_section.wait_until_present
  end

  def retailer_selected_present?
    current_selected_retailer.present?
  end

  def retailer_panel_present?
    my_retailer_panel.present?
  end

  def click_retailer_edit_link
    retailer_edit_link.when_present.click
  end

  def enter_retailer_location(location)
    search_by_location_field.set("#{location}")
  end

  def click_location_lookup_button
    location_lookup_button.when_present.click
  end

  def enter_retailer_name(name)
    search_by_name_field.set("#{name}")
  end

  def click_retailer_in_dropdown
    retailer_drop_down_link.click
  end

  def no_retailer_error_message_present?
    retailer_error_message.wait_until_present
  end

  def enter_invalid_inputs(invalid_location)
    search_by_location_field.set("#{invalid_location}")
  end

  def retailer_dropdown_visible
     retailer_dropdown.when_present
  end

  def retailer_list_present?
    retailer_selection.wait_until_present
    retailer_list.present?
  end

  def click_map_view_button
    map_view_button.click
  end

  def click_service_radio_button
    retailer_selection.wait_until_present
    service_radio_button.set
  end

  def click_step4_button
    step4_button.when_present.click
  end

  def step3
    page_loaded?
    click_retailer_edit_link
    search_by_name_field.set("birmingham")
    click_retailer_in_dropdown
    click_service_radio_button
    click_step4_button
  end

  private

  def retailer_section
    @browser.section(:id => "sb-retailer-section")
  end

  def my_retailer_panel
    @browser.div(:id => "retailerEditLeft")
  end

  def retailer_edit_link
    my_retailer_panel.span(:class => "fa-edit")
  end

  def search_by_location_field
    @browser.text_field(:id => "retailer-location-search")
  end

  def location_lookup_button
    @browser.button(:id => "retailer-location-search-submit")
  end

  def search_by_name_field
    @browser.text_field(:id => "retailer-name-search")
  end

  def current_selected_retailer
    @browser.div(:id => "retailerEditLeft-viewer").ul(:class => "my-car-form__summary").li
  end

  def retailer_dropdown
    @browser.ul(:id => "ui-id-2")
  end

  def retailer_drop_down_link
    retailer_dropdown.li(:class => "ui-menu-item").a
  end

  def retailer_error_message
    @browser.div(:id => "retailer-selection").p(:class => "form-error")
  end

  def retailer_selection
    @browser.div(:id => "retailer-selection")
  end

  def retailer_list
    retailer_selection.div(:id => "retailer-list")
  end

  def map_view_button
    retailer_list.p(:id => "show-retailer-map")
  end

  def service_radio_button
    @browser.div(:id => "retailer-list").ul(:id => "retailer-group").li.div(:class => "serviced-by").span.radio(:class => "vw-radio")
  end

  def step4_button
    @browser.button(:id => "goto-work")
  end
end

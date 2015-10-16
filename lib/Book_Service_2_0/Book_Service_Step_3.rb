class BookAService2Step3 < BookAService2

  def page_loaded?
    retailer_section.wait_until_present
  end

  def retailer_selected_present?
    current_selected_retailer_heading.present?
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
    retailer_drop_down_link.when_present.click
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
    @browser.div(:id => "retailerEditLeft-editor").ul(:class => "my-car-form__summary")
  end

  def current_selected_retailer_heading
    @browser.div(:id => "retailerEditLeft-editor").h4(:text => "Currently selected")
  end

  def retailer_drop_down_link
    @browser.ul(:id => "ui-id-3").li(:class => "ui-menu-item", :index => 0)
  end


end

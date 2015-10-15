class BookAService2Step3 < BookAService2




  private

  def retailer_section
    @browser.section(:id => "sb-retailer-section")
  end

  def my_retailer_panel
    @browser.div(:id => "retailerEditLeft")
  end

  def retailer_edit_lik
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

  
end

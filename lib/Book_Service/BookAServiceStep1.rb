class BookAServiceStep1 < BookAService
  def page_loaded?
    location_field.present?
  end

  def set_location(location)
    location_field.set(location)
  end

  def location_search
    location_button.click
  end

  def search_results_present?
    search_results.present?
  end

  def retailer_textbox
    retailer_field
  end

  def set_retailer(retailer)
    retailer_field.set(retailer)
  end

  def retailer_to_autopopulate
    select_autopopulate
  end

  def retailer_search
    retailer_button.click
  end

  def set_map_view
    map_view.when_present.click
  end

  def map_details_present?
    map_display.wait_until_present
  end

  def retailer_info_present?
    retailer_info.present?
  end

  def select_random_location
    location_radios[rand(location_radios.length)].click
  end

  def get_title
    page_title.text
  end

  private

  def location_field
    @browser.text_field(id: 'pc')
  end

  def retailer_field
    @browser.text_field(id: 'nameRetail')
  end

  def retailer_button
    @browser.button(class: 'vw-btn', index: 1)
  end

  def location_button
    @browser.button(class: 'vw-btn')
  end

  def search_results
    @browser.div(id: 'retailer-list')
  end

  def retailer_info
    @browser.div(id: 'retailer-details')
  end

  def select_autopopulate
    @browser.send_keys :tab
  end

  def map_view
    @browser.p(id: 'show-retailer-map')
  end

  def map_display
    @browser.div(id: 'map-container')
  end

  def location_radios
    @browser.radios(class: 'vw-radio')
  end

  def page_title
    @browser.div(id: 'page').h1
  end
end

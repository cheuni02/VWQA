class RetailerSearch < SpecialPages

  def visit
    visit_page(page_url)
  end

  def page_loaded?
    retailer_search_location.present?
  end

  def retailer_location_search(query)
    retailer_search_location.when_present.set(query)
    retailer_search_location_button.click
  end

  def get_first_result_title
    search_results.first.div(:class => "retailer-head").wait_until_present(30)
    search_results.first.div(:class => "retailer-head").h2.text
  end

  def search_error_present?
    search_error.present?
  end

  def retailer_name_search(name)
    retailer_search_name.set(name)
    retailer_search_name.send_keys :enter
    sleep(2)
    retailer_search_name_button.click
  end

  def set_map_view
    map_view.click
  end

  def retailer_map_present?
    retailer_map.wait_until_present(15)
  end

  def click_first_test_drive
    #search_results.first.div.div(:class => "ctas").link(:class => "test-drive").when_present.click
    search_results.first.wait_until_present
    test_drive_links.first.click
  end

  def click_first_book_service
    #search_results.first.div.div(:class => "ctas").link(:class => "book-service").when_present.click
    search_results.first.wait_until_present
    book_service_links.first.click
  end

  def click_first_retailer_offers
    search_results.first.link(:href => /\/retailers\/offers/i).when_present.click
  end

  def click_service_promise
    bottom_row_buttons[0].click
  end

  def click_order_status
    bottom_row_buttons[1].click
  end

  def click_book_test_drive
    bottom_row_buttons[2].click
  end

  def click_book_service
    bottom_row_buttons[3].click
  end

  private

  def page_url
    "/find-a-retailer"
  end

  def retailer_search_location
    @browser.text_field(:id => "searchTerm")
  end

  def retailer_search_name
    @browser.text_field(:id => "nameRetail")
  end

  def retailer_search_location_button
    @browser.input(:id => "searchSubmit")
  end

  def retailer_search_name_button
    @browser.input(:id => "nameSubmit")
  end

  def search_results
    @browser.divs(:class => "retailer-list-item")
  end

  def search_error
    @browser.p(:class => "error")
  end

  def map_view
    @browser.link(:href => "#map-view")
  end

  def retailer_map
    @browser.div(:id => "gmaps-view")
  end

  def bottom_row_buttons
    @browser.div(:class => "end-buttons").links(:class => "vw-button")
  end

  def test_drive_links
    @browser.execute_script("return document.getElementsByClassName('vw-button test-drive')")
  end

  def book_service_links
    @browser.execute_script("return document.getElementsByClassName('vw-button book-service')")
  end


end

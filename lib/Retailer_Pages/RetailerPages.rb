class RetailerPages < BrowserContainer
  def retailer_homepage_loaded?
    retailers_slideshow.present?
  end

  def retailer_offers_loaded?
    retailer_offers_list.present?
  end

  def get_current_id
    current_url.match(/(\d+)/)
  end

  def get_retailer_name
    retailer_name_header.when_present.text
  end

  def dismiss_google_maps_modal
    @browser.execute_script('window.alert = function() {}')
  end

  def retailers_slideshow
    @browser.div(id: 'retailers-slideshow')
  end

  def retailer_offers_list
    @browser.ul(class: 'offer-list')
  end

  def retailer_name_header
    @browser.li(class: 'title selected current')
  end

  def current_url
    @browser.url
  end
end

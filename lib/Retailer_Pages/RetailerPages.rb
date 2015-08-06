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



  private 

  def retailers_slideshow
    @browser.div(:id => "retailers-slideshow")
  end
  
  def retailer_offers_list
    @browser.ul(:class => "offer-list")
  end
  
  def current_url
    @browser.url  
  end




end
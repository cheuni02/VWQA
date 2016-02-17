class SpecialPages < BrowserContainer
  def dogs
    VWDogs.new(@browser)
  end

  def contact_us
    ContactUs.new(@browser)
  end

  def retailer_search
    RetailerSearch.new(@browser)
  end

  def site_search
    SiteSearch.new(@browser)
  end

  def vdt
    VwOrders.new(@browser)
  end
end

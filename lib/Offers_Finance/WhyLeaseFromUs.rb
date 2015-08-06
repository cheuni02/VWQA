class WhyLeaseFromUs < OffersFinance

  def visit
    visit_page(page_url)
  end

  def page_loaded?
    offer_carousel.wait_until_present
  end  

  def click_link(link)
    case link
      when /Tax Calculator/i
        tax_calc.click  
      when /View our latest offers/i
        latest_offers.click
      when /Contract hire finance calculator/i
        finance_calc.click
      when /Fleet 50+ cars/i
        fleet.click
      else raise
    end
  end

  def set_postcode(postcode)
    postcode_field.set(postcode)
    go_postcode.click
  end

  def set_name(name)
    name_field.set(name)
    go_name.click
  end

  def search_retailer
    result.wait_until_present

    if(result.text.include?("No results found"))
      return false
    else
      return true
    end
  end

  private

  def page_url
    "/buying-guide/small-business/why-lease-from-us"
  end

  def result
    @browser.ul(:class => 'retailer-search-results')
  end

  def name_field
    @browser.text_field(:id => 'search-retailer')
  end

  def postcode_field
    @browser.text_field(:id => 'search-location')
  end

  def go_name
    @browser.button(:id => 'go-retailer')
  end

  def go_postcode
    @browser.button(:id => 'go-location')
  end

  def offer_carousel
    @browser.div(:class => 'slideshow')
  end

  def tax_calc
    @browser.div(:class => 'tax-calculator')
  end

  def latest_offers
    @browser.link(:href => '/buying-guide/small-business/contract-hire-offers')
  end

  def finance_calc
    @browser.link(:href => '/businessFinanceCalculator/chooseModel')
  end

  def fleet
    @browser.link(:href => '/fleet')
  end
end
class OffersFinance < BrowserContainer
  include CommonNav

  def offers_page_loaded?
    offer_carousel.present?
  end

  def click_button_link(title)
    case title
    when /offers/i
      button_links[0].parent.when_present.click
    when /small business/i
      button_links[2].parent.when_present.click
    when /insurance/i
      button_links[1].parent.when_present.click
    when /motability/i
      button_links[3].parent.when_present.click
    end
  end

  def click_finance_calc_button
    finance_calc_button.link.click
  end

  def section_nav
    CommonNav::SectionNav.new(@browser)
  end

  def buying_guide
    @buying_guide = OffersBuyingGuide.new(@browser)
  end

  def finance_calculator
    @finance_calculator = FinanceCalculator.new(@browser)
  end

  def small_business_leasing
    SmallBusinessLeasing.new(@browser)
  end

  def offers_page
    FinanceOffersPages.new(@browser)
  end

  def finance_calc_new
    FinanceCalculatorNew.new(@browser)
  end

  def finance_options_explained
    FinanceOptionsExplained.new(@browser)
  end

  def why_lease
    WhyLeaseFromUs.new(@browser)
  end

  def visit
    visit_page(page_url)
  end

  private

  def offer_carousel
    @browser.div(class: 'vw-slideshow')
  end

  def button_links
    @browser.divs(class: 'vw-adaptive-horizontal-button')
  end

  def finance_calc_button
    @browser.div(class: 'finance-calculator')
  end

  def page_url
    '/buying-guide'
  end
end

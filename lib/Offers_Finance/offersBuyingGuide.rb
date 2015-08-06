#require_relative 'offers_finance.rb'

class OffersBuyingGuide < OffersFinance


  def page_loaded?
    offers_grid.present?
  end

  def select_car(car_model)
    offers_grid.lis.each do |car|
       if car.h3.text == "#{car_model}"
         car.link.click
	 break
       end
    end
  end

  def visit
    visit_page(page_url)
  end

  def offer_landing
    ModelOfferLanding.new(@browser)
  end

  def model_offers
    ModelOffers.new(@browser)
  end

  def click_finance_explain
    finance_explaination.when_present.click
  end

  def click_finance_calculator
    finance_calc_link_span.wait_until_present
    finance_calc_link_span.click
  end


  private

  def page_url
    "/buying-guide/offers"
  end

  def offers_grid
    @browser.ul(:class => "model-offer-grid")
  end

  def finance_explaination
    @browser.link(:class => "vw-btn", :href => /finance-options-explained/i)
  end

  def finance_calculator
    @browser.link(:class => "finance-calculator")
  end

  def finance_calc_link_span
    @browser.span(:class => "vw-icon-link", :text => /calculator/i)
  end




end

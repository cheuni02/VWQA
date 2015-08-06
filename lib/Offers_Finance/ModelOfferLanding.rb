class ModelOfferLanding < OffersBuyingGuide

  def page_loaded?
    wait_for_page
    offers_sidebar.present?
  end

  def wait_for_page
    offers_sidebar.wait_until_present
  end


  private

  def offers_sidebar
    @browser.div(:class => "side-offers")

  end

  def offer_table
    @browser.table(:class => "offer-table", :index => 0)
  end

  def offer_content
    @browser.div(:class => "offer-content")
  end




end

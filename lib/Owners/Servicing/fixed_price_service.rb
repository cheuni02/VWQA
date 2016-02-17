class FixedPriceService < Servicing
  def page_title
    @browser.title
  end

  def page_title_subject
    page_title.split(':').first.strip
  end
end

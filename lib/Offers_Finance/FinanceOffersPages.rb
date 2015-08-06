class FinanceOffersPages < OffersFinance

  def table_present?
    @browser.table.present?
  end

  def page_loaded?
    title.present?
  end

  def get_title
    title.text
  end

  private

  def title
    @browser.div(:id => 'page').div(:class => 'grid-6').h1
  end


end
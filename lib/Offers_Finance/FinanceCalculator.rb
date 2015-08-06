class FinanceCalculator < OffersFinance

  def model_grid_present?
    model_grid_div.wait_until_present
    model_grid.present?
  end

  def main_page_loaded?
    finance_form.wait_until_present
    trim_select.present?
    #main_panel.present?
  end

  def page_loaded?
    first_link.wait_until_present
  end

  def business_table_present?
    finance_table.ths.first.text =~ /monthly rental cost\*/i
  end

  def get_table_data
    index = 0
    data = []
    finance_table.tds.each do |cell|
      data.push(cell.text)
      index += 1
    end

    return data
  end

  def offers_page
    FinanceOffersPages.new(@browser)
  end

  def wait_for_table_load
    finance_table.wait_until_present
  end

  private

  def model_grid_div
    @browser.div(:id => "chooseModel")
  end

  def model_grid
    @browser.ol(:class => "car-thumbnails")
  end

  def trim_select
    @browser.div(:id => "trim-dropdown")
  end

  def main_panel
    @browser.li(:class => "finance-details")
  end

  def finance_table
    @browser.table(:class => "finance-table")
  end

  def finance_form
    @browser.form(:id => "derivativeSelection")
  end

  def first_link
    @browser.li(:class => 'passat-viii')
  end

end

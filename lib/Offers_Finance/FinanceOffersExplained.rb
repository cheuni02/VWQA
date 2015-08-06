class FinanceOptionsExplained < OffersFinance

  def visit
    visit_page(page_url)
  end

  def page_loaded?
    hirepurchase_button.wait_until_present
    selection_buttons.first.present?
  end

  def click_link(link)
    case link
      when 'Solutions'
        solutions_button.click
      when /Hire purchase/i
        hirepurchase_button.click
      when /Contract hire/i
        contracthire_button.click
      when /Existing finance customers/i
        existing_button.click
      when 'e-Solutions'
        e_solutions_button.click
      else raise
    end
  end

  def get_options
    selection_buttons
  end

  private

  def page_url
    "/buying-guide/finance-options-explained"
  end

  def selection_buttons
    @browser.divs(:class => "vw-adaptive-vertical-button")
  end

  def solutions_button
    @browser.div(:class => "vw-adaptive-vertical-button", :index => 0)
  end

  def hirepurchase_button
    @browser.div(:class => "vw-adaptive-vertical-button", :index => 1)
  end

  def contracthire_button
    @browser.div(:class => "vw-adaptive-vertical-button", :index => 2)
  end

  def existing_button
    @browser.div(:class => "vw-adaptive-vertical-button", :index => 3)
  end

  def e_solutions_button
    @browser.div(:class => "vw-adaptive-vertical-button", :index => 4)
  end
end

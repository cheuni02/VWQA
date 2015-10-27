class BookAService2Step5 < BookAService2

  def wait_for_page
    date_table.wait_until_present
  end

  def select_date_available
    date_first_available.when_present.click
  end

  def date_active?
    active_date.present?
  end














  private


  def date_table
    @browser.div(:class => "datepicker-days").table
  end

  def date_first_available
    date_table.tds(:class => 'day new').first
  end

  def active_date
    date_table.td(:class => "active")
  end













end

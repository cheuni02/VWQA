class BreakdownInsurance < Owners
  def page_loaded?
    ensurance_panel.wait_until_present(10)
  end

  def page_title
    @browser.title.split(':').first.strip
  end

  def ensurance_panel
    @browser.p(class: 'vw-button-more', text: 'Volkswagen ensurance')
  end
end

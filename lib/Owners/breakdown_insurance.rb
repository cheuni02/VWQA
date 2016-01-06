class BreakdownInsurance < Owners

  def page_loaded?
    ensurance_panel.wait_until_present(10)
  end








  private

  def ensurance_panel
    @browser.p(:class => 'vw-button-more', :text => 'Volkswagen ensurance')
  end









end

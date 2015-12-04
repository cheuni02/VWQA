class OwnersManual < Owners

  def page_loaded?
    owners_manual_vin_input.wait_until_present(10)
  end




  private

  def owners_manual_vin_input
    @browser.text_field(:id => 'number')
  end





end

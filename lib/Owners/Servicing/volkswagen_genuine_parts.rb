class VolkswagenGenuinePartsPage < Servicing
  def page_loaded?
    main_panel.wait_until_present(10)
  end

  private

  def main_panel
    @browser.div(id: 'what-we-check-why')
  end
end

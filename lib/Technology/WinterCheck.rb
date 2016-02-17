class WinterCheck < Servicing
  def page_loaded?
    winter_body.present?
  end

  private

  def winter_body
    @browser.div(class: 'grid-4')
  end
end

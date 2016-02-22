class ExpressFit < Servicing
  def page_loaded?
    fit_image.present?
  end

  private

  def fit_image
    @browser.div(class: 'grid-6')
  end
end

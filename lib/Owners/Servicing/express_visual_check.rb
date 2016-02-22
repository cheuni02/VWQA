class ExpressVisualCheck < Servicing
  def page_loaded?
    express.present?
  end

  def get_title
    title.text
  end

  private

  def title
    @browser.div(id: 'page').div(class: 'grid-6').h1
  end

  def express
    @browser.div(id: 'express-visual-check')
  end
end

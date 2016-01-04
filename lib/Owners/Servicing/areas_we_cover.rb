class AreasWeCover < Servicing

  def page_loaded?
    items.present?
  end

  def get_title
    title.text
  end

  private

  def title
    @browser.div(:id => "page").div(:class => "grid-6").h1
  end

  def items
    @browser.div(:id => "accessories")
  end

end
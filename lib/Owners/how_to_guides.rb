class HowToGuides < Owners
  def page_loaded?
    how_to_image_header.wait_until_present(10)
  end

  def page_title
    @browser.title.split(':').first.strip
  end

  def how_to_image_header
    @browser.img(alt: 'How to guides')
  end
end

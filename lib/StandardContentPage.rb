class StandardContentPage < BrowserContainer
  def get_header_text
    get_header.text
  end

  def image_loaded?
    get_image.loaded?
  end

  def count_button_links
    get_button_links.length
  end

  private

  def get_header
    @browser.h1(index: 0)
  end

  def get_image
    @browser.img(class: 'header')
  end

  def get_page_text
  end

  def get_button_links
    @browser.divs(class: 'vw-adaptive-horizontal-button')
  end
end

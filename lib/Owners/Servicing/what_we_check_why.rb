class WhatWeCheck < Servicing
  def visit
    visit_page(page_url)
  end

  def page_loaded?
    sections.wait_until_present(10)
  end

  def page_loaded_mot?
    mot_details.present?
  end

  def get_section_title(index)
    section_title(index).text
  end

  def click_button(index)
    section_button(index).click
  end

  def get_url
    "#{page_url}#{mot_url}"
  end

  private

  def page_url
    '/owners/servicing/what-we-check-and-why'
  end

  def mot_url
    '/mot-test#details'
  end

  def mot_details
    @browser.div(id: 'details')
  end

  def sections
    @browser.div(id: 'what-we-check-why')
  end

  def section_title(index)
    sections.div(class: 'listitem-component', index: "#{index}".to_i).div(class: 'title')
  end

  def section_button(index)
    sections.div(class: 'listitem-component', index: "#{index}".to_i).li(class: 'vw-button').link
  end
end

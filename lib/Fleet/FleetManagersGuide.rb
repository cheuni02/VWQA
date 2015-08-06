class FleetManagersGuide < Fleet

  def visit
    visit_page(page_url)
  end

#------- navigation pane -------
  def managers_nav_present?
    managers_nav.present?
  end

  def managers_nav_selected?
    managers_nav_link.present?
  end

  def managers_nav_guides_present?
    managers_nav_guides.present?
  end

  def managers_nav_guides_links_no
    man_nav_guides_links.size
  end

#------- header of the page and & description -------
  def managers_header_present?
    managers_header.present?
  end

  def managers_descr_section_present?
    managers_description_section.present?
  end

  def managers_description_present?
    managers_description.present?
  end

  def managers_desc_down_btn_pres?
    managers_desc_down_btn.present?
  end

  def managers_desc_share_present?
    managers_desc_share.present?
  end
#------- list of links to the guides --------
  def managers_guides_present?
    managers_guides.present?
  end

  def managers_guides_number
    managers_guides_links.size
  end

  def managers_guides_check_titles
    guides = managers_guides_links
    guides.each do |element|
      g = managers_guide_title(element)
      #puts "title of the guide: #{g.text}"
      raise AssertionError, "Title of the guide is empty" unless g.text != nil
    end
  end

  def managers_guides_check_m_info
    guides = managers_guides_links
    guides.each do |element|
      g = managers_guide_m_info(element)
      #puts "title of the guide: #{g.text}"
      raise AssertionError, "More info button is not displayed" unless g.text != nil
    end
  end

  def managers_guides_list
    managers_guides_links
  end

  def managers_guides_get_guide(guide)
    managers_guides_list[guide]
  end

  def managers_guides_click_guide(guide)
    title = managers_guide_title(managers_guides_get_guide(guide))
    title.when_present.click
  end

  def managers_guide_opened_title_p?
    managers_guide_opened_title.present?
  end

  def managers_guide_l_info_present?
    managers_guide_opened_l_info.present?
  end

  def managers_guide_click_l_info
    managers_guide_opened_l_info.when_present.click
  end

  def managers_guide_expanded_p?
    managers_guide_opened_content.present?
  end

  def managers_guide_text_present?
    managers_guide_opened_text.present?
  end

  def managers_guide_download_p?
    managers_guide_opened_download.present?
  end

  def managers_guide_share_p?
    managers_guide_opened_share.present?
  end

  def managers_guide_click_share
    managers_guide_opened_share.when_present.click
  end

  def managers_guide_share_section_p?
    managers_guide_share_section.present?
  end

  def managers_guide_click_share_close
    managers_guide_share_close.when_present.click
  end
  def managers_guide_to_top_present?
    managers_guide_to_top.present?
  end

  def managers_guide_click_to_top
    managers_guide_to_top.when_present.click
  end

  private
  def page_url
    "/fleet/managers"
  end

#------- navigation pane -------
  def managers_nav
    @browser.div(:id => 'section-nav')
  end

  def managers_nav_link
    @browser.link(:class => 'current', :href => '/fleet/managers')
  end

  def managers_nav_list
    #managers_nav_link.parent
    @browser.li(:class => 'current')
  end

  def managers_nav_guides
    managers_nav_list.ul
  end

  def man_nav_guides_links
    @browser.elements(:css => "div#section-nav li.current>ul>li")
  end

#------- header of the page & description -------
  def managers_header
    @browser.div(:class => 'fleet-managers-header')
  end

  def managers_description_section
    @browser.div(:class => /fleet-managers-paragraph/)
  end

  def managers_description
    managers_description_section.div(:class => 'left')
  end

  def managers_desc_down_btn
    down = managers_description_section.div(:class => 'right')
    down.a(:class => 'pdf download')
  end

  def managers_desc_share
    share = managers_description_section.div(:class => 'right')
    share.div(:class => 'share-this')
  end
#------- list of links to the guides -------
  def managers_guides
    @browser.div(:class => 'guides')
  end

  def managers_guides_links
    managers_guides.divs(:class => 'guide-section')
  end

  def managers_guide_title(guide)
    guide.a(:class => 'section-open')
  end

  def managers_guide_m_info(guide)
    guide.a(:class => 'section-open more-info')
  end

  def managers_guide_opened_header
    @browser.div(:class => 'guide-section-open clearfix')
  end

  def managers_guide_opened_title
    managers_guide_opened_header.a(:class => 'section-close')
  end

  def managers_guide_opened_l_info
    managers_guide_opened_header.a(:class => 'section-close less-info')
  end

  def managers_guide_opened_content
    @browser.div(:class => 'guide-section-content')
  end

  def managers_guide_opened_text
    managers_guide_opened_content.div(:class => 'left')
  end

  def managers_guide_opened_download
    managers_guide_opened_content.a(:class => 'pdf download')
  end

  def managers_guide_opened_share
    share = managers_guide_opened_content.div(:class => 'share-this')
    share.span
  end

  def managers_guide_share_section
    managers_guide_opened_content.div(:class => 'share-this-panel share-this-panel-choice')
  end

  def managers_guide_share_close
    managers_guide_share_section.span(:class => 'share-this-close')
  end

  def managers_guide_to_top
    @browser.a(:class => 'to-top', :href => '#')
  end
end
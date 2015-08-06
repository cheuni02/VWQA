class MPVDetails < Mpv

  def visit(carID)
    visit_page_mpv(page_url(carID))
  end

  def check_car_name(name)
    title.text == name
  end

  def wait_until_page_loaded
    title.wait_until_present
  end

  def get_options
    options
  end

  def open_configurator
    config_link.click
  end

  def configurator_link_present?
    config_link.present?
  end

  private

  def page_url(carID)
    #"/perfect-proto/app#/detail" + default_basics + "&rangeId=" + carID - Fine, but not the Ruby Way!
    "/perfect/app#/detail#{default_basics}&rangeId=#{carID}"
  end

  def title
    @browser.article(:class => 'detail-title').h1
  end

  def options_container
    @browser.div(:class => 'detail-cta')
  end

  def options
    options_container.links(:class =>'cta-link')
  end

  def config_link
    @browser.link(:class => 'config-link')
  end
end

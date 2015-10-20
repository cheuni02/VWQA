class BookAService2 < VWBase

  def visit
    visit_page(page_url)
  end

  def step1
    BookAService2Step1.new(@browser)
  end

  def step2
    BookAService2Step2.new(@browser)
  end

  def step4
    BookAService2Step4.new(@browser)
  end

  def expand_detail_panels
    detail_panels.each do |panel|
      panel.click if panel.present?
    end
  end


  private

  def page_url
    "/owners/service-booking"
  end

  def detail_panels
    @browser.spans(:class => "fa fa-edit")
  end

























end

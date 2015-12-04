class WhatWeCheckAndWhyPage < ServiceBase

  def page_loaded?
    main_section.wait_until_present(10)
  end


  private

    def main_section
      @browser.div(:id => "what-we-check-why")
    end





end

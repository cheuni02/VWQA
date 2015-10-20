class BookAService2Step4 < BookAService2


  private

    def work_section
      @browser.section(:id => "sb-work-section")
    end

    def step5_button
      @browser.button(:id => "goto-dateOptions")
    end

    

end

class BookAService2Step4 < BookAService2


  def work_sections_present?(work)
    edit_work_section.h2(:text => "#{work}").present?
  end

  def page_loaded?
    work_section.wait_until_present
  end

  def click_service_label
    service_label.click
  end

  def click_mot_label
    mot_label.click
  end

  private

    def work_section
      @browser.section(:id => "sb-work-section")
    end

    def step5_button
      @browser.button(:id => "goto-dateOptions")
    end

    def service_label
      @browser.label(:for => "work-service-check")
    end

    def mot_label
      @browser.label(:for => "work-mot-check")
    end

    def unplanned_work_label
      @browser.label(:for => "include-unplanned")
    end

    def edit_work_section
      @browser.div(:id => "workEditLeft-editor")
    end


end

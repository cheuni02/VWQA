class BookAService2Step4 < BookAService2

  def service_panel_present?
    work_section.wait_until_present
  end

  def service_and_mot_section_present?
    if service_label.visible? && mot_label.visible?
      return true
    else
      return false
    end
  end

  def page_loaded?
    Watir::Wait.while { loading_wheel.visible? } #need to look into
  end

  def click_service_label
    service_label.click
  end

  def click_mot_label
    mot_label.when_present.click
    sleep(2)
  end

  def work_sections_present?(section)
    work_section.section(:class => "#{section}").present?
  end

  def work_section_activities_present?(section)
    work_section.section(:class => "#{section}").div(:class => "radio__list").present?
  end

  def select_service_option(item = 0)
    service_choices.label(:for => "serviceRadio-0-0").when_present.click
  end

  def select_mot_option
    click_mot_label
    mot_choices.label(:for => "motRadio-0-4").when_present.click
  end

  def enter_info_other_checks_box
    other_checks.when_present.set("TESTING OPTIONS")
  end

  def click_step5_button
    step5_button.when_present.click
  end

  def service_work_errors_present?
    service_work_errors.wait_until_present(10)
  end

  def select_recommended_work_item(item = 0)
    recommended_work_section.label(:index => item).when_present.click
  end

  def select_unplanned_maintenance_item(item = 0)
    unplanned_maintenance_section.label(:index => item).when_present.click
  end

  def get_total_price
    estimated_price_section.text.gsub('£', '').to_i
  end

  def enable_unplanned_maintenance
    unplanned_work_label.when_present.click
    sleep(10)
  end

  def do_step_4
    select_service_option
    enter_info_other_checks_box
    click_step5_button
  end

  def edit_service_work
    edit_work
  end

  private

    def loading_wheel
      @browser.div(:class => "my-loading-shield")
    end

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

    def edit_work
      @browser.execute_script("document.getElementById('changeTo_workEditLeft-editor').click()")
    end

    def other_checks_input_box
      @browser.textarea(:id => "workOption-otherChecks")
    end

    def mot_choices
      @browser.div(:id => "mot-choices").div(:class => "radio__list")
    end

    def service_choices
      @browser.div(:id => "service-choices").div(:class => "radio__list")
    end

    def recommended_work_section
      @browser.section(:class => "routine-work").div(:class => "radio__list")
    end

    def unplanned_maintenance_section
      @browser.section(:class => "unplanned-maintenance").div(:class => "unplanned-panel").div(:class => "radio__list")
    end

    def estimated_price_section
      @browser.div(:id => "workEditLeft").span(:id => "total-price")
    end

    def other_checks
      @browser.textarea(:id => "workOption-otherChecks")
    end

    def step5_button
      @browser.button(:id => "goto-dateOptions")
    end

    def service_work_errors
      @browser.ol(:id => "sb-work-errors")
    end



end

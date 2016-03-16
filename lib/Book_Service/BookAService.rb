class BookAService < BrowserContainer
  def booking_step1
    BookAServiceStep1.new(@browser)
  end

  def booking_step2
    BookAServiceStep2.new(@browser)
  end

  def booking_step3
    BookAServiceStep3.new(@browser)
  end

  def booking_step4
    BookAServiceStep4.new(@browser)
  end

  def booking_step5
    BookAServiceStep5.new(@browser)
  end

  def visit
    visit_page(page_url)
  end

  def click_next_step
    next_step_button.when_present.click
  rescue Selenium::WebDriver::Error::UnhandledAlertError
    browser.execute_script('window.alert = function() {}')
    retry
  end

  def getFormErrors
    get_errors
  end

  def click_go_back
    back_step_button.parent.click
  end

  def convenience_options
    @browser.labels(class: "radio")
  end

  def options_free
    result = true
    convenience_options.each do |option|
      if option.text != "£0"
        result = false
      end
    end
    return result
  end

  def booking_nav
    @browser.div(id: "booking-nav").ul
  end

  def booking_steps(i)
    booking_nav.li(index: i)
  end

  private

  def page_url
    '/owners/service-booking'
  end

  def next_step_button
    @browser.button(class: 'vw-btn-active')
  end

  def get_errors
    @browser.ps(class: 'form-error')
  end

  def back_step_button
    @browser.span(class: 'vw-icon-back')
  end
end

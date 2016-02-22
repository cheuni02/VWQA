require 'json'
class AddCurrentCarStep2 < MyVW
  def step_1_summary
    @browser.element(class: 'my-car-form__text')
  end

  def step_1_summary_reg
    step_1_summary.li(index: 0).span(index: 1)
  end

  def step_1_summary_model
    step_1_summary.li(index: 1).span(index: 1)
  end

  def step_1_summary_details
    step_1_summary.li(index: 2).span(index: 1)
  end

  def step_1_summary_acquired_as
    step_1_summary.when_present.li(index: 3).text.match(/\:(.*)[a-zA-Z0-9]/).to_s.delete(':').strip
  end

  def step_1_summary_car_name
    step_1_summary.when_present.li(index: 4).text.match(/\:(.*)[a-zA-Z0-9]/).to_s.delete(':').strip
  end

  def go_to_section_3
    @browser.element(id: 'goto-section-3')
  end

  def change_step_1
    @browser.button(id: 'change-section-1')
  end

  def preselected_retailer
    @browser.element(class: 'radio__list')
  end

  def preselected_retailer_radio
    preselected_retailer.radio(index: 0)
  end

  def step_2_finish
    @browser.button(id: 'submit-no-owner')
  end
end

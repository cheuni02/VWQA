class MPVFeatures < Mpv

  def visit_summary
    visit_page_mpv(summary)
  end

  def wait_for_page_load_summary
    questions_container.wait_until_present
  end

  def get_questions
    questions
  end

  def get_answers(index)
    answers(index)[0].wait_until_present
    answers(index)
  end

  def open_question(item)
    item.a.click
  end

  def questions_container_present?
    questions_container.present?
  end

  def next_item
    next_button.click
  end

  private

  def summary
    "/perfect/app#/choices#{default_basics}"
  end

  def questions_container
    @browser.ul(:id => 'features-summary')
  end

  def questions
    questions_container.lis(:class => 'question-li')
  end

  def question
    @browser.li(:class => 'question-li')
  end

  def answers(index)
    @browser.ul(:class =>'answers-list', :index => index.to_i).links
  end

  def next_button
    @browser.link(:class => 'next-form-item-arrow-button')
  end
end

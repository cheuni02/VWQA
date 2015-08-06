class MPVMustHaves < Mpv

  def visit_musthaves
    visit_page_mpv(default_url)
  end

  def wait_for_summary
    must_haves_summary.wait_until_present
  end

#force update
  def get_summary_items
    summary_links
  end

  def visit_musthaves_yourdrive(page_number)
    visit_page_mpv(your_drive(page_number))
  end

  def question_container_present?
    question_container.present?
  end

  def get_question
    question_container.wait_until_present(30)
    question.wait_until_present(30)
    question.text
  end

  def get_question_items
    question_items
  end

  def wait_for_new_question(oldquestion, newquestion)
    Watir::Wait.until { newquestion != oldquestion }
  end

  def check_url(page_number)
    @browser.url.include? "/perfect/app#/musthaves/question/your-drive/#{page_number}"
  end

  private

  def your_drive(page_number)
    "/perfect/app#/musthaves/question/your-drive/#{page_number}#{default_basics}"
  end

  def default_url
    "/perfect/app#/musthaves/intro/#{default_basics}"
  end

  def question_container
    @browser.div(:class => 'choices-question-form-items')
  end

  def question_items
    question_container.divs(:class => 'choices-question-form-item')
  end

  def must_haves_summary
    @browser.ul(:id => 'musthaves-summary')
  end

  def summary_links
    must_haves_summary.lis
  end

  def question
    @browser.p(:class => 'question-text')
  end

end

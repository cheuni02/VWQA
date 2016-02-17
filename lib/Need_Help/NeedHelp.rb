class NeedHelp < BrowserContainer
  def ask_question_present?
    question_box.present?
  end

  def page_title
    @browser.title.split(':').first.strip
  end

  def wait_until_present_ask_question
    question_box.wait_until_present
  end

  def set_query(query)
    question_box.set(query)
  end

  def search_query
    question_search.click
  end

  def query_results_present?
    question_results.present?
  end

  def category_dropdown
    category_links.click
  end

  def click_category_link(name)
    option = category_links.option(text: "#{name}")
    if option.present?
      option.click
      @browser.button(id: 'searchSubmit').when_present.click
      return true
    else
      return false
    end
  end

  def visit
    visit_page(page_url)
  end

  def question_box
    @browser.text_field(id: 'searchTerm')
  end

  def search_results_query
    @browser.p(class: 'search-message').text.split('"')[1]
  end

  def question_search
    @browser.button(id: 'searchSubmit')
  end

  def question_results
    @browser.element(class: 'results-container')
  end

  def category_links
    @browser.select_list(id: 'category')
  end

  def page_url
    '/need-help'
  end
end

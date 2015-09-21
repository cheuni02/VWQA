class News < AboutUs

  def visit
    visit_page(page_url)
  end

  def get_latest_article
    latest_article_id
  end

  def expand_news_section
    news_section.click
  end

  def article_present
    article_result
  end

  def article_text
    compare_article
  end

  def input_text_in_search
    enter_text_in_search
    search_box_enter_button.click
  end

  private

  def page_url
    "/about-us/news"
  end

  def latest_article_id
    @article = @browser.ul(:id => "news-list").li(:class => "grid-row", :index => 0).div(:class => "grid-4").h3.link.text
  end

  def news_section
    @browser.div(:class => "side-bar").li(:index => 1).a
  end

  def search_box
    @browser.text_field(:name => "query")
  end

  def article_result
    @a_result = @browser.div(:class => "search-container", :index => 1).ul(:class => "listing").li.div.h3.text
  end

  def compare_article
    @article
  end

  def search_box_enter_button
    @browser.button(:id => "search-submit")
  end

  def enter_text_in_search
    search_box.set("#{@article}")
  end

end

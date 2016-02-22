class PartsGuarantee < Servicing
  def page_loaded?
    find_retailer.present?
  end

  def page_title
    @browser.title.split(':').first.strip
  end

  def find_retailer
    @browser.p(class: 'lnkSCheck').link
  end
end

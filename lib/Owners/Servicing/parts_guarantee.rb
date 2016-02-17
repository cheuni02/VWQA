class PartsGuarantee < Servicing
  def page_loaded?
    find_retailer.present?
  end

  private

  def find_retailer
    @browser.p(class: 'lnkSCheck').link
  end
end

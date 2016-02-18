class GMTF < VWBase

  def load_page (url)
    @browser.goto("#{ENV['HOST']}"+url)
  end
  def get_scripts_list
    @browser.scripts
  end
  def get_tag
    @browser.script(:src => "//grmtech.net/r/deba9a56ce0a9bfa26e8ed9e10b2cc8f46.js")
  end
end
class GMTF < VWBase

  def load_page (url)
   @cc=@browser.goto("#{ENV['HOST']}"+url)
  end
  def get_scripts_list
    arrJS = []
     page = Nokogiri::HTML(open(@cc))
     page.css('script').each do |script|
       src = script['src']
       arrJS << src.to_s unless src.nil?
    end
   return arrJS
  end
  def get_tag
    return '//grmtech.net/r/deba9a56ce0a9bfa26e8ed9e10b2cc8f46.js'
  end
end
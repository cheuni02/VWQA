require 'nokogiri'

class Tracking < BrowserContainer

  def find_conversion_script
    conversion_script.exists?
  end

  def conversion_cdata?
    conversion_cdata_script
  end

  def valid_id?
    conversion_cdata_script.html.match(/google_conversion_id\s=\s[0-9]{10}/).nil?
  end

  def con_noscript
    conversion_noscript.html
  end

  def parse_con_noscript
    parsed_html = Nokogiri::HTML(self.con_noscript)
    return parsed_html.css("img").to_s.match(/viewthroughconversion\/[0-9]{10}/).nil?
  end

  def conversion_iframe
    iframe_pixel.attribute_value('src')
  end

  def iframe?
    con_iframe.exists?
  end

  def get_iframe_hash
    source = conversion_iframe
    source = source[/U1.+/].split('/')
    arr = []
    source.each do |i|
      a = i.split(':')
      arr.push(a)
    end
    return arr.to_h
  end

  private

    def conversion_script
      @browser.script(:src => /conversion.js/i)
    end

    def conversion_cdata_script
      script = @browser.script(:src => /conversion.js/i)
      return script.element(:xpath => './preceding-sibling::*[1]')
    end

    def noscripts
      @browser.noscripts
    end

    def conversion_noscript
      noscripts.last
    end

    def con_iframe
      @browser.iframe(:id => 'mediacom-configurator')
    end

    def iframe_pixel
      con_iframe.img(:index => 0)
    end
end

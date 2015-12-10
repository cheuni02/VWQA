#require_relative 'CommonNav.rb'

class VWHomepage < BrowserContainer
  #include CommonNav
 def visit
   visit_page
   self.dismiss_cookies
 end

 def dismiss_cookies
   if cookie_button.present?
     cookie_button.click
   end
 end

 def click_homepage_link(text)
   get_homepage_links(text).first.link.click
 end

 def click_carousel_index(index)
   carousel_link(index - 1).click
   sleep(3)
 end

 def carousel_header_present?(index)
   homepage_item_content(index - 1).wait_until_present(10)
 end

 def vw_logo_present?
   vw_logo.present?
 end

 def quick_link_present?(text)
   #sleep(5)
   get_homepage_links(text).length
 end

 def wait_for_quicklinks
   homepage_links.wait_until_present
 end

 def click_quick_link(text)
   get_homepage_links(text).first.link.click
 end

 def find_homepage_image(image_name)
   homepage_carousel_images.each do |img|
     if img.src =~ /#{image_name}/i
       return true
     end
   end

   return false
 end

 private

 def cookie_button
   @browser.link(:class => "cookie-continue")
 end

 def get_homepage_links(text)
   @browser.ul(:class => "quick-links").lis(:text => /#{text}/i)
 end

 def homepage_links
   @browser.ul(:class => "quick-links")
 end

 def carousel_link(index)
   @browser.div(:class => "owl-page", :index => index).span
 end

 def homepage_item_content(index)
   @browser.div(:class => "owl-item", :index => index).div.link
 end

 def vw_logo
   @browser.li(:id => "nav-home")
 end

 def homepage_carousel_images
   @browser.div(:class => "owl-wrapper").images
 end
end

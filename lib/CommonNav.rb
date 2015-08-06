module CommonNav

  class PrimaryNav

    def initialize(browser)
      @browser = browser
    end

    def click_new_cars
      top_level_nav.li(:id => "nav-new").link.click
    end

    def click_offers_finance
      top_level_nav.li(:id => "nav-buying-guide").link.click
    end

    def click_owners
      top_level_nav.li(:id => "nav-owners").link.click
    end

    def click_need_help
      top_level_nav.li(:id => "nav-ask-volkswagen").link.click
    end

    def click_fleet_link
      top_level_nav.li(:id => "nav-fleet").link.click
    end

    def book_test_drive
      book_test_drive_button.link.click
    end

    def book_service
      book_service_button.link.click
    end

    def retailer_search
      retailer_search_button.link.click
    end

    def click_login
      login.link.click
    end

    def click_logout
      logout.link.click
    end


    private

    def top_level_nav
      @browser.ul(:id => "nav")
    end

    def login
      @browser.li(:class => "login")
    end

    def logout
      @browser.li(:class => "logout")
    end

    def book_test_drive_button
      @browser.div(:id => "top-bar").li(:class => "test-drive")
    end

    def retailer_search_button
      @browser.div(:id => "top-bar").li(:class => "retailer")
    end

    def book_service_button
      @browser.div(:id => "top-bar").li(:class => "service")
    end
  end

  def self.primary_nav(browser)
    @nav = PrimaryNav.new(browser)
  end

  class NewCarNav

    def initialize(browser)
      @browser = browser
    end

    def select_primary_item(text)
      bar_nav_primary.link(:text => /#{text}/i).click
    end

    def select_secondary_item(text)
      select_primary_item(text)
    end

    def main_nav_present
      bar_nav_primary.present?
    end

    #@Deprecated - Do not use .hover as it screws up in firefox:
    #Cannot perform native interaction: Could not load native events component. [Selenium::WebDriver::Error::InvalidElementStateError]
    def select_submenu_item(parent, child)
      bar_nav_primary.link(:text => /#{parent}/i).hover #
      bar_nav_primary.link(:text => /#{child}/i).click
    end

    private

    def bar_nav_primary
      @browser.div(:id => "submenu-sticky").ul
    end
  end

  class SectionNav

    def initialize(browser)
      @browser = browser
    end

    def click_link(link_text)
      link = nil
      nav_items.each do |item|
	      if item.link(:text => /#{link_text}/i).exists?
	        link = item.link(:text => /#{link_text}/i)
	        break
	      end
      end

      STDOUT.puts link
      link.click unless link.nil?
    end


    private

    def nav_items
      @browser.div(:id => "section-nav").lis
    end
  end

  class Footer

    def initialize(browser)
      @browser = browser
    end

    def click_footer_link(text)
      footer_items.each do |item|
	      if item.link.text =~ /#{text}/i
	        item.link.click
	        break
	      end
      end
    end

    private

    def footer_items
      @browser.div(:id => "footer").ul.lis
    end
  end

  def self.new_car_nav(browser)
    @nav = NewCarNav.new(browser)
  end
end

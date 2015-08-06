#!/bin/env ruby
# encoding: utf-8

require 'watir-webdriver'
require 'cucumber'
require 'require_all'
require 'securerandom'
require 'fileutils'
require 'webdriver-user-agent'


screenshot_dir = "html-results/screenshots"
#screenshot_dir = 'C:\Automation-Reports\VW\Front-End' + "\Screenshots-#{Time.now.day}-#{Time.now.month}"
FileUtils.mkdir_p screenshot_dir
Watir.default_timeout = 20

VW_USER = "vw_envs"
VW_PASSWORD = "sooT5wioAhxuiH0o"

=begin
URLS = { :production => 'http://www.volkswagen.co.uk',
         :production_c => 'http://origin.volkswagen.co.uk',
         :stage => 'http://origin-stage-vw.tribalddb.co.uk',
	       :stage_v => 'http://www-stage-vw.tribalddb.co.uk',
         :int => 'http://origin-int-vw.tribalddb.co.uk',
         :int_p => 'http://www-int-vw.tribalddb.co.uk',
         :uat_p => 'http://vw-uat10-preview.tribalddb.co.uk',
    		 :cms_p => 'http://cms-preview.volkswagen.co.uk',
         :stage_mpv => 'https://perfect-stage-vw.tribalddb.co.uk',
         :dev01 => 'http://origin-devxx-vw.tribalddb.co.uk/',
         :uat => 'http://origin-uat-vw.tribalddb.co.uk/'
      }
=end


URLS = "http://#{ENV['HOST']}"

DEFAULT_ACCOUNT = {
  :title => "Mr",
  :first_name => "AutomatedTestUser",
  :surname => "AutomatedTestUser",
  :email_base => "@example.com",
  :password => "Abcd!2345" ,
  }

require_all 'lib'

if ENV['HEADLESS'] =~ /true/i
  require 'headless'
  headless = Headless.new
  headless.start
end

case ENV['BROWSER']
when /chrome/i
  browser = Watir::Browser.new :chrome
  browser.window.resize_to 1024, 768
when /ie/i
  browser = Watir::Browser.new :ie
  browser.window.resize_to 1024, 768
when /firefox/i
  profile = Selenium::WebDriver::Firefox::Profile.new
  profile['browser.cache.disk.enable'] = false
  profile['browser.cache.disk.capacity'] = 0
  profile['network.http.pipelining'] = true
  profile['network.http.pipelining.maxrequests'] = 8
  browser = Watir::Browser.new :firefox, :profile => profile
when 'iPhonep', 'iPadMinip'
  driver = Webdriver::UserAgent.driver(:browser => :chrome, :agent => :iphone, :orientation => :portrait)
  browser = Watir::Browser.new driver
  if ENV['BROWSER'] == 'iPadMinip'
    browser.window.resize_to 1024, 768
  else
    browser.window.resize_to 320, 568
  end
when 'iPhonel', 'iPadMinil'
  driver = Webdriver::UserAgent.driver(:browser => :chrome, :agent => :iphone, :orientation => :landscape)
  browser = Watir::Browser.new driver
  browser.window.resize_to 568, 320
  if ENV['BROWSER'] == 'iPadMinil'
    browser.window.resize_to 768, 1024
  else
    browser.window.resize_to 568, 320
  end
else # Default to Firefox if we don't know exactly what we're using
  profile = Selenium::WebDriver::Firefox::Profile.new
  profile['browser.cache.disk.enable'] = false
  profile['browser.cache.disk.capacity'] = 0
  profile['network.http.pipelining'] = true
  profile['network.http.pipelining.maxrequests'] = 8
  browser = Watir::Browser.new :firefox, :profile => profile
  browser.window.resize_to 1024, 768
end


# Auth Handling, forces login to servers in active session
unless ENV['TAG'].to_sym == :live
  browser.goto(URLS.sub('http://', "http://#{VW_USER}:#{VW_PASSWORD}@"))
  browser.goto(URLS.sub('http://', "https://#{VW_USER}:#{VW_PASSWORD}@"))
  usub = URLS.sub('origin', 'www')
  browser.goto(usub.sub('http://', "https://#{VW_USER}:#{VW_PASSWORD}@"))
end


#browser.window.resize_to 1024, 768 unless ENV['BROWSER'] =~ /mobile/i

class CustomWorld
  class << self; attr_accessor :browser end
  #attr_accessor :browser

  def site
    @site ||= (VWBase.new(CustomWorld::browser))
  end

end

CustomWorld.browser = browser

World do
  CustomWorld.new
  #STDOUT.puts CustomWorld.browser
end

Before do
  #STDOUT.puts browser.cookies.to_a
  #STDOUT.puts ENV['PCOOKIE']
  #STDOUT.puts ENV['NPCOOKIE']
end

After do |scenario|
  #STDOUT.puts scenario.name
  if scenario.failed?
    time = Time.now.strftime("%Y-%m-%d-%H%M%S")
    name = "#{time}-#{scenario.name}".slice(0, 250).gsub(/[\,\/]/, '-')
    name.gsub!(/[\|\s\#]/, '')
    file_dir = "#{screenshot_dir}/#{name}.png"
    browser.screenshot.save "#{file_dir}"
    embed("screenshots/#{name}.png", "image/png" "SCREENSHOT")
  end
end


at_exit do
 browser.close
 if ENV['HEADLESS'] =~ /true/i
   headless.destroy
 end
 begin
   require_relative '../../HTMLReport.rb'
 rescue
   puts "Unable to generate HTML Report - Skipping Report Generation"
 end
end

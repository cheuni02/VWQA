#!/bin/env ruby
# encoding: utf-8

require 'watir-webdriver'
require 'cucumber'
require 'require_all'
require 'securerandom'
require 'fileutils'
require 'json'
require 'rspec/expectations'
require 'pry'

screenshot_dir = "html-results/screenshots"
FileUtils.mkdir_p screenshot_dir
Watir.default_timeout = 20

VW_USER = "vw_envs"
VW_PASSWORD = "sooT5wioAhxuiH0o"


URLS = "http://#{ENV['HOST']}"

DEFAULT_ACCOUNT = {
  :title => "Mr",
  :first_name => "AutomatedTestUser",
  :surname => "AutomatedTestUser",
  :email_base => "@example.com",
  :password => "Abcd!2345" ,
  }

ffprofile = Selenium::WebDriver::Firefox::Profile.new
# Disable Disk Caching in firefox because of problems with display on windows
ffprofile['browser.cache.disk.enable'] = false
ffprofile['browser.cache.disk.capacity'] = 0

# Firefox performance settings
ffprofile['network.http.pipelining'] = true
ffprofile['network.http.pipelining.maxrequests'] = 8
ffprofile['network.http.pipelining.aggressive'] = true
ffprofile['nglayout.initialpaint.delay'] = 0
ffprofile['browser.cache.use_new_backend'] = 1
ffprofile['network.prefetch-next'] = true
ffprofile['browser.tabs.animate'] = false
ffprofile['browser.display.show_image_placeholders'] = false
ffprofile['network.dns.disableIPv6'] = true
ffprofile['content.notify.backoffcount'] = 5
ffprofile['gfx.direct2d.disabled'] = true
ffprofile['layers.acceleration.disabled'] = true



require_all 'lib'

if ENV['HEADLESS'] =~ /true/i
  require 'headless'
  headless = Headless.new
  headless.start
end

case ENV['BROWSER']
when /chrome/i
  browser = Watir::Browser.start(ENV['HOST'], :chrome)
  browser.window.resize_to 1024, 768
when /ie/i
  browser = Watir::Browser.new :ie
  browser.window.resize_to 1024, 768
when /firefox/i
  profile = Selenium::WebDriver::Firefox::Profile.new
  browser = Watir::Browser.new :firefox, :profile => ffprofile
else # Default to Firefox if we don't know exactly what we're using
  browser = Watir::Browser.new :firefox, :profile => ffprofile
  browser.window.resize_to 1024, 768
end


# Auth Handling, forces login to servers in active session
unless ENV['TAG'].to_sym == :live
  browser.goto(URLS.sub('http://', "http://#{VW_USER}:#{VW_PASSWORD}@"))
  browser.goto(URLS.sub('http://', "https://#{VW_USER}:#{VW_PASSWORD}@"))
  usub = URLS.sub('origin', 'www')
  browser.goto(usub.sub('http://', "https://#{VW_USER}:#{VW_PASSWORD}@"))
end


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
end

Before do
  browser.execute_script("window.alert = function() {}")
end

AfterStep do
  begin
    browser.execute_script("window.alert = function() {}")
  rescue Selenium::WebDriver::Error::UnhandledAlertError
    browser.execute_script("window.alert = function() {}")
    retry
  end
end





After do |scenario|
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

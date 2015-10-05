#!/bin/env ruby
# encoding: utf-8

class BrowserContainer

  def initialize(browser)
    @browser = browser
    @browser.cookies.add('ico-cookies', 'true', {:path => "/", :expires => Time.now + 86400, :secure => false})
    @browser.cookies.add('poi', 'Non-Psyma', {:path => "/", :expires => Time.now + 86400, :secure => false})
    @first = true
  end

  def get_source
    @browser.html
  end

  def visit_page(page_url = "")
    @browser.goto(URLS + page_url)
  end
end

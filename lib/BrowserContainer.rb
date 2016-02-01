#!/bin/env ruby
# encoding: utf-8

class BrowserContainer
  def initialize(browser)
    @browser = browser
    @browser.cookies.add('ico-cookies', 'true', path: '/', expires: Time.now + 86_400, secure: false)
    @browser.cookies.add('poi', 'Non-Psyma', path: '/', expires: Time.now + 86_400, secure: false)
    @first = true
  end

  def get_source
    @browser.html
  end

  def refresh
    @browser.refresh
  end

  def visit_page(page_url = '')
    @browser.goto(URLS + page_url)
  end

  def scroll_to(param)
    args = case param
           when :top, :start
             'window.scrollTo(0, 0);'
           when :center
             'window.scrollTo(document.body.scrollWidth / 2, document.body.scrollHeight / 2);'
           when :bottom, :end
             'window.scrollTo(0, document.body.scrollHeight);'
           else
             fail ArgumentError, "Don't know how to scroll to: #{param}!"
           end

    @browser.execute_script(*args)
  end
end

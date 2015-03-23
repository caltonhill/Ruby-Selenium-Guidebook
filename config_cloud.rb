require 'sauce_whisk'

ENV['base_url']         ||= 'http://the-internet.herokuapp.com'
ENV['host']             = 'saucelabs'
ENV['operating_system'] ||= 'Windows XP'
ENV['browser']          ||= 'internet_explorer'
ENV['browser_version']  ||= '8'
ENV['SAUCE_USERNAME']   = 'macdonaldjames'
ENV['SAUCE_ACCESS_KEY'] = '9124401a-9b6c-4e50-9022-c6d27468c380'


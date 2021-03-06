require 'selenium-webdriver'
require_relative 'support/matchers'

RSpec.configure do |config|

  
  config.before(:each) do
    case ENV['host']
    when 'saucelabs'
      caps = Selenium::WebDriver::Remote::Capabilities.send(ENV['browser'])
      caps.version = ENV['browser_version']
      caps.platform = ENV['operating_system']
      caps[:name] = example.metadata[:full_description]
      
      @driver = Selenium::WebDriver.for(
        :remote,
        url: "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub",
        desired_capabilities: caps)
    else 
      case ENV['browser']
      when 'firefox'  
        @driver = Selenium::WebDriver.for :firefox
      when 'chrome'
        Selenium::WebDriver::Chrome::Service.executable_path = File.join(Dir.pwd, 'tools/chromedriver.exe')
        @driver = Selenium::WebDriver.for :chrome
     end 
   end  
   if ENV['host'] == 'saucelabs'
      $job_message = "Watch a video of the test at https://saucelabs.com/tests/#{@driver.session_id}"
    else
      $job_message = ""
    end
end
  
  config.after(:each) do
    if ENV['host'] == 'saucelabs'
     if example.exception.nil?
        SauceWhisk::Jobs.pass_job @driver.session_id
     else
        SauceWhisk::Jobs.fail_job @driver.session_id
     end
   end
    @driver.quit
  end
  
end

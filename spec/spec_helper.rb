require 'selenium-webdriver'

RSpec.configure do |config|
      # rspec-expectations config goes here. You can use an alternate
      # assertion/expectation library such as wrong or the stdlib/minitest
      # assertions if you prefer.
  
  config.before(:each) do
    case ENV['host']
    when 'saucelabs'
      caps = Selenium::WebDriver::Remote::Capabilities.send(ENV['browser'])
      caps.version = ENV['browser_version']
      caps.platform = ENV['version']
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

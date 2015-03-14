require 'selenium-webdriver'
require_relative 'login_form_page_object'

describe Login do
  
before(:each) do
  @driver = Selenium::WebDriver.for :firefox
    ENV['base_url'] = 'http://the-internet.herokuapp.com'
  @login = Login.new(@driver)
  end

after(:each) do
 @driver.quit
end

it 'login_succeeded' do
  @login.with('tomsmith','SuperSecretPassword!')
  @login.success_message_present?.should be_truthy
  end
end

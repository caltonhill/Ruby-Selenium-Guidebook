require_relative 'spec_helper'
require_relative '../base_page_objects/login_page_object'

describe 'Login', priority: 'critical' do
  
before(:each) do
    @login = Login.new(@driver)
  end

it 'login_succeeded' do
    @login.with('tomsmith','SuperSecretPassword!')
    @login.success_message?.should be_displayed
  end
  
it 'login_failed' do
    @login.with('wrong','wrong')
    @login.failure_message?.should be_displayed
    #@login.success_message?.should be false
  end
  
it 'forced failure' do
  @login.with('wrong','wrong')
  @login.failure_message?.should_not be_displayed
end
  
end

require_relative 'spec_helper'
require_relative '../base_page_objects/login_page_object'

describe 'Login', priority: 'critical' do
  
before(:each) do
    @login = Login.new(@driver)
  end

it 'login_succeeded' do
    @login.with('tomsmith','SuperSecretPassword!')
    @login.success_message_present?.should be true
  end
  
it 'login_failed' do
    @login.with('wrong','wrong')
    #@login.failure_message_present?.should be true
    @login.success_message_present?.should be false
  end
  
end

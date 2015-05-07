require_relative 'spec_helper'
require_relative '../base_page_objects/dynamic_loading_page_object'

describe 'Dynamic Loading', depth: 'deep' do
  
  before(:each) do
    @dynamic_loading = DynamicLoading.new(@driver)
  end
  
  it 'Example 1: Hidden Element' do
    @dynamic_loading.dynamic_example 1
    @dynamic_loading.start
    @dynamic_loading.finish_text_present?.should be_true
  end
  
  it 'Example 2: Rendered after the fact' do
    @dynamic_loading.dynamic_example 2
    @dynamic_loading.start
    @dynamic_loading.finish_text_present?.should be_true
  end
  
end

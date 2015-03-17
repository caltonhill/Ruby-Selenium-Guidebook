require_relative '../base_page_objects/dynamic_loading_page_object2'

describe 'Dynamic Loading' do
  
  before(:each) do
    @dynamic_loading = DynamicLoading.new(@driver)
  end
  
  it 'Example 2: Rendered after the fact' do
    @dynamic_loading.dynamic_example 2
    @dynamic_loading.start
    @dynamic_loading.finish_text_present?.should be_truthy
  end
  
end

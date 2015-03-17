require_relative '../base_page_objects/dynamic_loading_page_object'

describe 'Dynamic Loading' do
  
  before(:each) do
    @dynamic_loading = DynamicLoading.new(@driver)
  end
  
  it 'Example 1: Hidden Element' do
    @dynamic_loading.start
    @dynamic_loading.finish_text_present?.should be_truthy
  end
  
end

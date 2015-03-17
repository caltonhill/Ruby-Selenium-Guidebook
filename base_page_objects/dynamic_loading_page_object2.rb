require_relative 'base_page_object'

class DynamicLoading < BasePage
  
  START_BUTTON = {css: '#start button'}
  FINISH_TEXT = {id: 'finish'}
  
  def dynamic_example(page_number)
    visit "/dynamic_loading/#{page_number}"
  end
  
  def start
    click START_BUTTON
  end
  
  def finish_text_present?
    wait_for(10) { is_displayed? FINISH_TEXT }
  end
  
end
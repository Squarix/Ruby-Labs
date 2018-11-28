require 'nokogiri'
class Parser 
  attr_accessor :page, :driver, :browser, :name_file
  def initialize(name_file)
    @name_file = name_file    
  end  
    
  def set_session(session)
    @browser = session
    @driver = @browser.driver.browser
  end

  def set_page(page)
    return 'Capybara isn\'t set' if browser.nil?
  
    @browser.visit(page)
    @page = Nokogiri::HTML(@driver.page_source)
  end

  def get_data_src(name)
    return 'Capybara isn\'t set' if browser.nil?
    
    text = ''
    @page.search(name).each do |tag|
        text += tag.attr('data-src') + "\n"
    end
    text
  end

  def get_tag_text(name)
    return 'Capybara isn\'t set' if browser.nil?
   
    text = ''
    @page.search(name).each do |tag|
      text += tag.text[0..200] + "\n"
    end
    text
  end  
end
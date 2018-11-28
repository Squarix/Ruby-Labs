require 'selenium-webdriver'
require 'capybara'
class CapybaraHelper
  class << self
    def get_session
      Capybara.register_driver :selenium do |app|
        Capybara::Selenium::Driver.new(app, browser: :chrome)
      end
      Capybara.javascript_driver = :chrome
      Capybara.configure do |config|  
        config.default_max_wait_time = 5 
        config.default_driver = :selenium
      end
      Capybara.current_session
    end
  end
end
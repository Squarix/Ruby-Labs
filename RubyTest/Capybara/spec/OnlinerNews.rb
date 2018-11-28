require 'capybara'
require 'selenium-webdriver'

Capybara.register_driver :firefox do |app|
  Capybara::Selenium::Driver.new(app, :browser => :firefox)
end
Capybara.javascript_driver = :firefox
Capybara.configure do |config|
  config.default_max_wait_time = 5
  config.default_driver = :selenium
end



Capybara.current_session.visit('http://www.onliner.by')
Capybara.default_selector = :xpath
csv_text = Capybara.current_session.evaluate_script('$(".b-section-main__col-fig").attr("src")') + '\n'
csv_text += Capybara.current_session.evaluate_script('$(".b-main-page-news-2__news-list-image a img").attr("src")') + '\n'

csv_text += Capybara.current_session.evaluate_script('$(".b-main-page-news-2__news-list-text p").text()')

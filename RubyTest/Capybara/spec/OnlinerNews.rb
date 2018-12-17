require 'capybara'
require 'selenium-webdriver'

Capybara.register_driver :firefox do |app|
  Capybara::Selenium::Driver.new(app, :browser => :firefox)
end
Capybara.javascript_driver = :firefox
Capybara.default_max_wait_time = 5
Capybara.default_driver = :selenium

page = Capybara.current_session
page.visit('http://www.onliner.by')

result = []
images = []
descriptions = []
titles = []

page.all('section.b-main-page-news-2__main-news div.b-main-page-news-2__main-news-text p').each do |el|
  descriptions.push(el.text[0..200])
end

page.all('section.b-main-page-news-2__main-news span.helpers_hide_mobile-small').each do |el|
  titles.push(el.text)
end

page.all('section.b-main-page-news-2__main-news img.b-section-main__col-fig').each do |el|
  images.push(el['src'])
  p el
  p el['src']
end

images.length.times do |i|
  result[i] =
    {
      image: images[i],
      title: titles[i],
      description: descriptions[i]
    }
end

file = 'data.csv'
File.open(file, 'w') do |csv|
  result.each do |item|
    csv << "\n#{item[:image]}\n#{item[:title]}\n#{item[:description]}\n\n"
  end
end
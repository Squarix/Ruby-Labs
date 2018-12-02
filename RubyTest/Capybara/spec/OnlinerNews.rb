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

link = page.all('h2 a')
link.first.click

result = []
images = []
descriptions = []
titles = []

page.all('div', class: 'news-tidings__speech').each do |el|
  descriptions.push(el.text[0..200])
end

page.all('span', class: 'news-helpers_hide_mobile-small').each do |el|
  titles.push(el.text)
end

page.all('div', class: 'news-tidings__image').each do |el|
  images.push(el['style'])
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
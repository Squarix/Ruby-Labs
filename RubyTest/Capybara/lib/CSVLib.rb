require 'csv'
class CsvHelper
  class << self
    def write(text, name_file)
        CSV.open(name_file, 'a+') do |csv|
            csv << [text]
        end
    end
  end
end
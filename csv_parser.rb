require 'csv'
require 'json'

class CsvParser

  def self.read! filename
    elements_array = []
    CSV.parse(filename) do |row|
      elements_array.push row
    end
    return elements_array
  end

  def self.to_json elements_array
    keys = ["name", "email"]
    final_array = []
    elements_array.each do |element|
      element.shift(1)
      final_array.push Hash[*keys.zip(element).flatten]
    end
    return final_array
  end

  def self.run! filename, destination_file
    arrays = read! filename
    hash_names = to_json(arrays)
    File.open("#{destination_file}.json", "w") do |f|
      f.write(hash_names.to_json)
    end
  end
end

# CsvParser.run! ARGV[0], ARGV[1]

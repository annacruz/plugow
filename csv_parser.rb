require 'csv'
require 'json'
class CsvParser
#Hash[*keys.zip(data).flatten]
  def self.read! filename
    elements_array = []
    CSV.foreach(filename) do |row|
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

  def self.run! filename
    arrays = read! filename
    hash_file = to_json(arrays)
    File.open("temp.json", "w") do |f|
      f.write(hash_file.to_json)
    end
  end
end

CsvParser.run! ARGV[0]

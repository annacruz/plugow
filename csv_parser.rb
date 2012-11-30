require 'csv'
class CsvParser
#Hash[*keys.zip(data).flatten]
  def self.read!(filename)
    elements_array = []
    CSV.foreach(filename) do |row|
      elements_array.push(row)
    end
    return elements_array
  end

  def self.to_json(elements_array)
    keys = ["name", "email"]
    elements_array.shift
    Hash[*keys.zip(elements_array).flatten]
  end
end
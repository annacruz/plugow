require 'spec_helper'
require './csv_parser'
describe 'CsvParser' do
  let!(:data) { [["123", "John Doe", "john@example.org"], ["8918", "Mary Doe", "mary@example.org"]]}
  let!(:result) { [{"name" => "John Doe", "email" => "john@example.org"}, {"name" => "Mary Doe", "email" => "mary@example.org"}] }
  it "should return a hash after import csv" do
    expect(CsvParser.to_json(data)).to be_eql(result)
  end
end

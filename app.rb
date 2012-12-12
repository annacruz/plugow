require 'haml'
require 'sinatra'
require './csv_parser'

require 'sinatra/reloader' if development?

get '/' do
  temp_filenames = []
  Dir.foreach('./public/') do |filename|
    temp_filenames.push(filename)
  end
  @filenames = temp_filenames.reject!{|f| f.each_char.first == '.'}
  haml :index
end

get '/conversor' do
  haml :conversor_form
end

post '/conversor' do
  CsvParser.run! params['csv_file'][:tempfile], "public/#{params['destination']}"
  redirect "#{params['destination']}.json"
end

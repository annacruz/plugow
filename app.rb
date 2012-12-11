require 'haml'
require 'sinatra'
require './csv_parser'

require 'sinatra/reloader' if development?

get '/' do
  haml :index
end

get '/test' do
  haml :conversor_form
end

post '/test' do
  item = CsvParser.read! params['csv_file'][:tempfile]
  "#{item}"
end

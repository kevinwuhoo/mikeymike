require 'sinatra'
require 'json'

get '/text/:text' do
  {
    "item": [
      {
        "text": params[:text],
        "type": 0
      }
    ]
  }.to_json

end

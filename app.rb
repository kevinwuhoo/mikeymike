require 'sinatra'
require 'json'

get '/text/:text' do
  {
    'item': [
      {
        'text': params[:text],
        'type': 0
      }
    ]
  }.to_json
end

get '/images/:category' do
  images = {}

  images['milanos'] = [
    'http://wac.9ebf.edgecastcdn.net/809EBF/ec-origin.boston.barstoolsports.com/files/2011/11/cookies_top_milano.jpg',
    'http://cdn1-blog.hwtm.com/wp-content/uploads/2010/10/candycane_mintmilanos_2.jpg',
    'http://s3.amazonaws.com/bzzagent-bzzscapes-prod/hmmmm-mint-milano-lrg.png',
    'http://archive.delawareonline.com/blogs/secondhelpings/uploaded_images/mattmarden-799425.JPG',
    'https://bootsandcatsblog.files.wordpress.com/2013/04/milano-cookies.jpg'
  ]


  geckoboard = { item: [] }
  images[params[:category]].each do |img|
    geckoboard[:item] << {
      text: "<img src='#{img}'>",
      type: 0
    }
  end

  geckoboard.to_json
end

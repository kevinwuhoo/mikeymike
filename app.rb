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

  images['pies'] = [
    'http://schema.openspring.net/sites/default/files/apple-pie-ck-709820-l_0.jpg',
    'http://hostedmedia.reimanpub.com/TOH/Images/Photos/37/300x300/exps6086_HB133235C07_19_4b.jpg',
    'http://toneitup.com/blog/wp-content/uploads/2010/12/apple_pie-tone-it-up-healthy-recipe.jpg',
    'http://friendshiphousemsu.org/wp-content/uploads/2013/06/apple-pie-main.jpg',
    'http://simpledailyrecipes.com/wp-content/uploads/Organic-Apple-Pie.jpg',
    'http://imgls.com/wp-content/uploads/2014/06/apple-pie-recipe.jpg',
    'http://lilmisscakes.com/blog/wp-content/uploads/2011/11/Mini-Apple-Pies-001-1024x682.jpg',
    'http://www.hannahgrimesmarketplace.com/wp-content/uploads/apple-pie-oh-173264-xl.jpg'
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

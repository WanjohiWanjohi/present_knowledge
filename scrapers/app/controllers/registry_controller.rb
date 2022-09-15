class RegistryController < Sinatra::Base

    # Add this line to set the Content-Type header for all responses
    set :default_content_type, 'application/json; text/html; charset=utf-8'
  
    get '/registry/:id' do
      products = Product.all.order(:title)
      products.to_json
    end

    get '/registries' do
        product = Product.find(params[:product_id])
        product.to_json
    end

    post '/registries/create' do 
      request.body.rewind  
      data = JSON.parse request.body.read
      puts data
    end
   
end
  
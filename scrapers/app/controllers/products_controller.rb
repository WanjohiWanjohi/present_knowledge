class ProductsController < Sinatra::Base

    # Add this line to set the Content-Type header for all responses
    set :default_content_type, 'application/json; text/html; charset=utf-8'
  
    get '/products' do
      products = Product.all.order(:title)
      products.to_json
    end
    get '/product/:id' do
        product = Product.find(params[:product_id])
        product.to_json
    end
   
end
  
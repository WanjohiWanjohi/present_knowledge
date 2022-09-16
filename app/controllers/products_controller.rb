require "sinatra"
require "sinatra/cors"
require 'sinatra/base'
class ProductsController < Sinatra::Base

    # Add this line to set the Content-Type header for all responses
    set :default_content_type, 'application/json; text/html; charset=utf-8'
    set :allow_origin, "*"
    set :allow_methods, "GET,DELETE,PATCH,OPTIONS"
    set :allow_headers, "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept, if-modified-since"
    set :expose_headers, "location,link"

    get '/products' do
      products = Product.all.order(:title)
      products.to_json
    end
    get '/products/:id' do
        product = Product.find(params[:product_id])
        product.to_json
    end
   
end
  
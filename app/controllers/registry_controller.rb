require "sinatra"
require "sinatra/cors"
require 'sinatra/base'
require 'pry'
class RegistryController < Sinatra::Base

    # Add this line to set the Content-Type header for all responses
    set :default_content_type, 'application/json; text/html; charset=utf-8'
    set :allow_origin, "*"
    set :allow_methods, "GET,DELETE,PATCH,OPTIONS"
    set :allow_headers, "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept, if-modified-since"
    set :expose_headers, "location,link"
    
    get '/registry' do
      products = Product.all.order(:title)
      body products.to_json
    end

    get '/registries/:id' do
        product = Product.find(params[:product_id])
        body product.to_json
    end

    post '/registries/create' do 
      request.body.rewind  
      data = JSON.parse request.body.read
      puts data.values
      #TODO:FIx this
      id = data[:registryName].to_s + data[:registryEvent].to_s 
      Registry.create(id: id ,name: data[:registryName], event: data[:registryEvent])
    end
    post '/registries/add/:id'do
    request.body.rewind  
    data = JSON.parse request.body.read
    
    
    end
   
end
  
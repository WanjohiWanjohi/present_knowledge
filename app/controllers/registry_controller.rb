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
      products = Registry.all.order(:title)
      body products.to_json
    end

    get '/registries/:id' do
        product = Registry.find(params[:id]).includes(:registry_item).includes(:product)
        body product.to_json
    end

    post '/registries/create' do 
      request.body.rewind  
      data = JSON.parse request.body.read
      #TODO:FIx this
      id = data[:registryName].to_s + data[:registryEvent].to_s 
      r = Registry.create(id: id ,name: data[:registryName], event: data[:registryEvent])
      body r
    end
    post '/registries/add_product'do
      request.body.rewind  
      data = JSON.parse request.body.read
      r = RegistryItem.create(data)
      body r
    end
    delete '/registries/delete/:id' do
      Registry.find(params[:id]).destroy
    end
end
  
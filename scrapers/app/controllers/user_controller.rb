require 'sinatra/base'
class UserController < Sinatra::Base

  configure do
      enable :cross_origin

      set :allow_origin, "*" # allows any origin(domain) to send fetch requests to your API
      set :allow_methods, [:get, :post, :patch, :delete, :options] # allows these HTTP verbs
      set :allow_credentials, true
      set :max_age, 1728000
      set :expose_headers, ['Content-Type']
  end

  options '*' do
      response.headers["Allow"] = "HEAD,GET,POST,DELETE,OPTIONS"
      response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"
      200
  end
    # Add this line to set the Content-Type header for all responses
    # set :default_content_type, 'application/json'

    get '/hello'do
    puts "Hello World!"
    end

    get '/users' do
      users = User.all.order(:name).limit(10)
      puts users
    end
    get '/users/:id' do
        user = User.find(params[:id])
        user.to_json(include: { registries: { include: :products } })
    end
    post "/users/new" do
      request.body.rewind  
      data = JSON.parse request.body.read
    end
end

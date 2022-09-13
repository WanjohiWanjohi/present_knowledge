class UserController < Sinatra::Base

    # Add this line to set the Content-Type header for all responses
    set :default_content_type, 'application/json'
  
    get '/users' do
      users = User.all.order(:name).limit(10)
      users.to_json
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
  
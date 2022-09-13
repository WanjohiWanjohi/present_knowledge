ENV["RACK_ENV"] ||= "development"
set :database_file, "./database.yml"
require 'bundler/setup'
Bundler.require(:default, ENV["RACK_ENV"])
require_all 'app'


  
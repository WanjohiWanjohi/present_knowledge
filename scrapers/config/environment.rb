ENV["RACK_ENV"] ||= "development"
ENV["RACK_INPUT"]||= "ASCII-8BIT"
require 'bundler/setup'
Bundler.require(:default, ENV["RACK_ENV"])
require_all 'app'


  
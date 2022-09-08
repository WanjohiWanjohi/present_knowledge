class Product  < ActiveRecord::Base
    has_many :users
    has_many :registries through: :users
end
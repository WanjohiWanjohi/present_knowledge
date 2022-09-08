class Product  < ActiveRecord::Base
  
    has_many :product_details
    has_many :registries
    has_many :users ,through: :registries
end
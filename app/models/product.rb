# require `active_record`

class Product  < ActiveRecord::Base
    has_many :product_detail
    has_many :registry
    has_many :user ,through: :registry
end
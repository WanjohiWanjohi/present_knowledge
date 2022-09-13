# require `active_record`

class Product  < ActiveRecord::Base
    has_many :product_detail
    has_many :registry
    has_many :user ,through: :registry
    def create_product(product_hash)
        Product.create(product_hash)
    end
end
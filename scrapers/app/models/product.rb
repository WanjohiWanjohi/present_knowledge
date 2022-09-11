require `active_record`
class Product  < ActiveRecord::Base
    has_many :product_details
    has_many :registries
    has_many :users ,through: :registries
    def create_product(product_id)
    end
end
class Registry < ActiveRecord::Base
    belongs_to :user
    has_many :products
end
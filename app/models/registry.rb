class Registry < ActiveRecord::Base
    belongs_to :user
    has_many :products ,through: :registry_items
end
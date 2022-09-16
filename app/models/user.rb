class User  < ActiveRecord::Base
    has_many :registries
    has_many :products , through: :registries
end
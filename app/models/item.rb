class Item < ApplicationRecord
    has_many :recipes
    has_many :bakeries, through: :recipes
    has_many :orders
    has_many :customers, through: :orders
    
end

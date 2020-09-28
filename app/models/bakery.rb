class Bakery < ApplicationRecord
    has_many :recipes
    has_many :items, through: :recipes
end

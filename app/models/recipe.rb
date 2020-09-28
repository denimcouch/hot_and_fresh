class Recipe < ApplicationRecord
    belongs_to :item
    belongs_to :bakery
end

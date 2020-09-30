class Order < ApplicationRecord
    belongs_to :customer
    belongs_to :item
    belongs_to :bakery
end

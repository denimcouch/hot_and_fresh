class Bakery < ApplicationRecord
    has_many :recipes
    has_many :items, through: :recipes

    def most_purchased
        self.items.sort{ |item|
            item.orders.count
        }.reverse[0]
    end
end

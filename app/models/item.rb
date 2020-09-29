class Item < ApplicationRecord
    has_many :recipes
    has_many :bakeries, through: :recipes
    has_many :orders
    has_many :customers, through: :orders
    
    def made_by
        self.recipes.collect{|recipe| recipe.bakery.name }
    end

    def times_purchased
        self.orders.count
    end
    
end

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

    def popular_item?
        if self.times_purchased > 5
            "Hot and Fresh Best Seller!"
        else
            "A tasty treat"
        end
    end
 
end

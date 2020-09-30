class Bakery < ApplicationRecord
    has_many :recipes
    has_many :items, through: :recipes
    has_many :orders
    has_many :customers, through: :orders

    def most_popular
        self.items.sort{ |item|
            item.orders.count
        }.reverse[0]
    end
    
    def most_valued_customer
        (self.customers.max_by{|c| c.orders.count})
    end

    def most_valued_customer_orders
        self.most_valued_customer.orders.select{|order| order.bakery_id == self.id}
    end

    def total_sales
        (self.orders.collect{|order| order.item}).sum{|item| item.price}
    end
    
end

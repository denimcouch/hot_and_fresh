class Customer < ApplicationRecord
    has_many :orders
    has_many :items, through: :orders 

    def full_name
        self.first_name + " " + self.last_name
    end

    def orders_by_date
        self.orders.sort_by{ |orders|
            orders.created_at
        }.reverse
    end

    def orders_by_bakery
        self.orders.sort_by{ |orders|
            orders.bakery_id
        }.reverse
    end

    def order_history_by_bakery
        ((self.orders_by_bakery.group_by{|order| order.bakery_id }).map{|k,v| k = Bakery.find(k), v = v}).to_h
    end

    def order_history
        self.orders_by_date.group_by{|o| o.created_at.strftime("%D")}
    end

   
    

end



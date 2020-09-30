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

    def order_history
        self.orders_by_date.group_by{|o| o.created_at.strftime("%D")}
    end

end

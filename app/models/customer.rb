class Customer < ApplicationRecord
    has_many :orders
    has_many :items, through: :orders 
    has_many :bakeries, through: :orders
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true
    validates :password, presence: true
    has_secure_password

    def full_name
        self.first_name + " " + self.last_name
    end

    def favorite_item
        fave = (self.orders.group_by{| order | order.item}).max_by{ |k,v| v.count }
        fave[0].name
    end
    def favorite_bakery
        bakeries_group = self.orders.group_by{|order| order.bakery}
        fave_bakery = bakeries_group.max{|k,v| v.count}
        fave_bakery
    end
    def favorite_bakery_name
        self.favorite_bakery[0].name
    end
    def favorite_bakery_times_ordered
        self.favorite_bakery[1].count
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

    def order_history_by_date
        self.orders_by_date.group_by{|o| o.created_at.strftime("%D")}
    end
    #total spent on items
    def total_spent
    custy.orders.sum{|order| order.item.price}
    end

    # def total_spent_at_bakery(bakery_name)
        #total spent on items by bakery
        # bakery = self.order_history_by_bakery
        #look at all the orders from a specific bakery
        #find the total price of all the items inside the value
    # end

end



class Order < ApplicationRecord
    belongs_to :customer
    belongs_to :item
    belongs_to :bakery

    def order_total
    self.item.price 
    end
    
    def  employee_discount
        #apply discount when placing order 
    self.order_total * 0.75
        #dicount price by 25%
        end


end

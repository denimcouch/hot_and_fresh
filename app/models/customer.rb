class Customer < ApplicationRecord
    has_many :orders
    has_many :items, through: :orders

    def full_name
        self.first_name + " " + self.last_name
    end
end

class AddBakeryIdToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :bakery_id, :integer
  end
end

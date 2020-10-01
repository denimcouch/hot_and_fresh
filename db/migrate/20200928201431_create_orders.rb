class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :item_id
      t.integer :bakery_id

      t.timestamps
    end
  end
end

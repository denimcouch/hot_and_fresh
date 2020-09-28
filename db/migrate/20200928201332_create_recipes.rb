class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.integer :item_id
      t.integer :bakery_id
      t.string :ingredients
      t.integer :cook_time

      t.timestamps
    end
  end
end

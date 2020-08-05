class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|

      t.string :name, null:false
      t.integer :price, null:false
      t.integer :send_price, null:false
      t.text :description, null:false
      t.integer :integer , null:false
      t.string :brand
      t.string :ship_day, null:false
      t.string :category_id, null:false
      t.timestamps
    end
  end
end

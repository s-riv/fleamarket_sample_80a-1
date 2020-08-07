class AddDetailsToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :status, :integer, null:false
    add_column :products, :condition, :integer, null:false
  end
end

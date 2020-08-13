class AddUserIdToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :user_id, :integer, null:false
  end
end

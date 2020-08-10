class RemoveIntegerFromProduct < ActiveRecord::Migration[6.0]
  def up
    remove_column :products, :integer
  end

end

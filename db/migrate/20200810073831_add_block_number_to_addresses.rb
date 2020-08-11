class AddBlockNumberToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :block_number, :string
    change_column :addresses, :postal_code, :string
  end
end

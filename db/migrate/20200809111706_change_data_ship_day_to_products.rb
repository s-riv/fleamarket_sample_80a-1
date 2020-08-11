class ChangeDataShipDayToProducts < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :ship_day, :integer
  end
end

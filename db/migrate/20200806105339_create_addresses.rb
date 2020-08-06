class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :user, null:false, foreign_key:true
      t.integer :postal_code, null:false
      t.integer :prefecture_id, null:false, foreign_key: true
      t.string   :municipality, null:false
      t.string   :apartment_name
      t.timestamps
    end
  end
end

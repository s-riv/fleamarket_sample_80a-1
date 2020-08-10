class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user, optional: true
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :municipality
    validates :apartment_name
  end
end

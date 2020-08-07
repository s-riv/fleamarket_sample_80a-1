class Address < ApplicationRecord
  belongs_to :user, optional: true

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :municipality
    validates :apartment_name
  end
end

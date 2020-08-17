class Contract < ApplicationRecord
  validates :product_id, :user_id, presence: true
  belongs_to :user
  belongs_to :product
end

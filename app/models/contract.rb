class Contract < ApplicationRecord
  validates :product_id, :user_id, presence: true
end

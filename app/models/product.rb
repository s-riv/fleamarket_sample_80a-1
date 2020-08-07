class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :condition
    validates :status
    validates :send_price
    validates :ship_day
    validates :category_id
  end

end

class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash        :prefecture
  belongs_to :category
  belongs_to :user
  has_many :images, dependent: :destroy
  has_one :contract
  accepts_nested_attributes_for :images, allow_destroy: true

  enum condition:   { 新品／未使用: 0, 未使用に近い: 1, 目立った傷や汚れなし: 2, やや傷や汚れあり: 3, 傷や汚れあり: 4, 全体的に状態が悪い: 5 }
  enum status:      { display: 0, sold: 1 }
  enum send_price:  { 出品者負担: 0, 購入者負担: 1 }
  enum ship_day:    { １〜２日で発送: 0, ２〜３日で発送: 1, ４〜７日で発送: 2 }

  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :condition
    validates :status
    validates :send_price
    validates :ship_day
    validates :category_id
    validates :prefecture_id
  end

end

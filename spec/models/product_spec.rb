require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#create' do
    it "is invalid " do
      product  = create(:product)
      product.valid?
      expect(product).to be_valid
    end

    it "is invalid without name " do
      product = build(:product,  name: "")
      product.valid?
      expect(product.errors[:name]).to include("を入力してください")
    end

    it "is invalid without description " do
      product = build(:product,  description: "")
      product.valid?
      expect(product.errors[:description]).to include("を入力してください")
    end

    it "is invalid without price " do
      product = build(:product,  price: "")
      product.valid?
      expect(product.errors[:price]).to include("を入力してください")
    end

    it "is invalid without condition " do
      product = build(:product,  condition: "")
      product.valid?
      expect(product.errors[:condition]).to include("を入力してください")
    end

    it "is invalid without status " do
      product = build(:product, status: "")
      product.valid?
      expect(product.errors[:status]).to include("を入力してください")
    end

    it "is invalid without send_price " do
      product = build(:product, send_price: "")
      product.valid?
      expect(product.errors[:send_price]).to include("を入力してください")
    end

    it "is invalid without ship_day " do
      product = build(:product, ship_day: "")
      product.valid?
      expect(product.errors[:ship_day]).to include("を入力してください")
    end


    it "is valid without category_id " do
      product = build(:product,  category_id: nil)
      product.valid?
      expect(product.errors[:category_id]).to include("を入力してください")
    end
  end
end
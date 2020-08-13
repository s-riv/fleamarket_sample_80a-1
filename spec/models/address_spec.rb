require 'rails_helper'

RSpec.describe Address, type: :model do
  describe '#create' do
    it "is valid " do
      user    = build(:user)
      address = build(:address, user_id: user.id)
      address.valid?
      expect(address).to be_valid
    end

    it "is valid without apartment name" do
      user    = build(:user)
      address = build(:address, user_id: user.id, apartment_name: "")
      address.valid?
      expect(address).to be_valid
    end



    it "is invalid without postal_code" do
      user    = build(:user)
      address = build(:address, user_id: user.id, postal_code: "")
      address.valid?
      expect(address.errors[:postal_code]).to include("を入力してください")
    end

    it "is invalid without prefecture_id" do
      user    = build(:user)
      address = build(:address, user_id: user.id, prefecture_id: nil)
      address.valid?
      expect(address.errors[:prefecture_id]).to include("を入力してください")
    end

    it "is invalid without municipality" do
      user    = build(:user)
      address = build(:address, user_id: user.id, municipality: "")
      address.valid?
      expect(address.errors[:municipality]).to include("を入力してください")
    end

    it "is invalid without block_number" do
      user    = build(:user)
      address = build(:address, user_id: user.id, block_number: "")
      address.valid?
      expect(address.errors[:block_number]).to include("を入力してください")
    end

    it "is invalid with incorrect postal_code format" do
      user    = build(:user)
      address = build(:address, user_id: user.id, postal_code: "1234567")
      address.valid?
      expect(address.errors[:postal_code]).to include("は不正な値です")
    end
  end
end

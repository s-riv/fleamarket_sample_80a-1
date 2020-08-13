require 'rails_helper'

RSpec.describe Contract, type: :model do
  describe '#create' do
    it 'is valid' do
      user = create(:user)
      contract = build(:contract, user_id: user.id)
      contract.valid?
      expect(contract).to be_valid
    end

    it 'is invalid without product_id' do
      user = create(:user)
      contract = build(:contract, user_id: user.id, product_id: "")
      contract.valid?
      expect(contract.errors[:product_id]).to include("を入力してください")
    end

    it 'is invalid without user_id' do
      user = create(:user)
      contract = build(:contract, user_id: user.id, user_id: "")
      contract.valid?
      expect(contract.errors[:user_id]).to include("を入力してください")
    end
  end
end

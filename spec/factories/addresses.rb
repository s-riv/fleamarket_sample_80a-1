FactoryBot.define do
  factory :address do
    # user_id               {1}
    postal_code           {"123-4567"}
    prefecture_id         {1}
    municipality          {"墨田区"}
    block_number          {"1-1-1"}
    apartment_name        {"テックエキスパート101"}
  end

end

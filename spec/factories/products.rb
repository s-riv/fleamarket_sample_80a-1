FactoryBot.define do

  factory :product do
    name                  {"スニーカー"}
    description           {"ブランドものです"}
    price                 {10000}
    condition             {2}
    status                {1}
    send_price            {1}
    ship_day              {1}
    brand                 {"エルメス"}
    category_id           {1}
  end

end

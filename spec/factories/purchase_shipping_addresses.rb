FactoryBot.define do
  factory :purchase_shipping_address do
    post_code { '123-4567' }
    prefectures_id { 30 }
    municipality { '名古屋市' }
    house_number { '1-1' }
    building_name { '名古屋ハイツ' }
    phone_number { '09000000000' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end

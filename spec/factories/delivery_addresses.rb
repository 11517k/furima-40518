FactoryBot.define do
  factory :delivery_address do
    postal_code       { '123-4567' }
    prefecture_id     { 2 }  # あなたの都道府県データの中の有効なID
    city_ward_town    { '東京都渋谷区' }
    street_address    { '青山1-2-3' }
    building_name     { '青山ビル101' }
    phone_number      { '09012345678' }
    association       :purchase_record
  end
end
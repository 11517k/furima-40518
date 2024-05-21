FactoryBot.define do
  factory :purchase_delivery do
    postal_code       { '123-4567' }
    prefecture_id     { 2 }
    city    { '東京都渋谷区' }
    address    { '青山1-2-3' }
    building     { '青山ビル101' }
    phone_number      { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
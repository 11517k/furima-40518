FactoryBot.define do
  factory :item do
    price              { Faker::Number.between(from: 300, to: 9_999_999) }
    item_name          { 'テスト商品' }
    description        { 'テスト商品の説明です。' }
    category_id        { 2 }
    item_condition_id  { 2 }
    shipping_fee_payer_id { 2 }
    prefecture_id      { 2 }
    days_to_ship_id    { 2 }

    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

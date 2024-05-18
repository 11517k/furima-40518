require 'rails_helper'

RSpec.describe PurchaseDelivery, type: :model do
  before do
    @purchase_delivery = FactoryBot.build(:purchase_delivery)
  end

  it 'すべてのフィールドが存在すれば保存できること' do
    expect(@purchase_delivery).to be_valid
  end

  it '郵便番号が空では保存できないこと' do
    @purchase_delivery.postal_code = nil
    @purchase_delivery.valid?
    expect(@purchase_delivery.errors.full_messages).to include("Postal code can't be blank")
  end

  it '郵便番号は3桁-4桁の形式でないと保存できないこと' do
    @purchase_delivery.postal_code = '1234567'
    @purchase_delivery.valid?
    expect(@purchase_delivery.errors.full_messages).to include('Postal code is invalid')
  end

  it '都道府県が空では保存できないこと' do
    @purchase_delivery.prefecture_id = nil
    @purchase_delivery.valid?
    expect(@purchase_delivery.errors.full_messages).to include("Prefecture can't be blank")
  end

  it '市区町村が空では保存できないこと' do
    @purchase_delivery.city_ward_town = nil
    @purchase_delivery.valid?
    expect(@purchase_delivery.errors.full_messages).to include("City ward town can't be blank")
  end

  it '番地が空では保存できないこと' do
    @purchase_delivery.street_address = nil
    @purchase_delivery.valid?
    expect(@purchase_delivery.errors.full_messages).to include("Street address can't be blank")
  end

  it '建物名は空でも保存できること' do
    @purchase_delivery.building_name = nil
    expect(@purchase_delivery).to be_valid
  end

  it '電話番号が空では保存できないこと' do
    @purchase_delivery.phone_number = nil
    @purchase_delivery.valid?
    expect(@purchase_delivery.errors.full_messages).to include("Phone number can't be blank")
  end

  it '電話番号が10桁以上11桁以内でなければ保存できないこと' do
    @purchase_delivery.phone_number = '090123456789'
    @purchase_delivery.valid?
    expect(@purchase_delivery.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
  end
end
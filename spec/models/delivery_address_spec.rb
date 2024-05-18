require 'rails_helper'

RSpec.describe PurchaseDelivery, type: :model do
  before do
    @purchase_delivery = FactoryBot.build(:purchase_delivery)
  end

  describe '配送先情報の保存' do
    context '内容に問題がない場合' do
      it 'すべての項目が正しく入力されていれば保存できる' do
        expect(@purchase_delivery).to be_valid
      end

      it '建物名がなくても保存できる' do
        @purchase_delivery.building = ''
        expect(@purchase_delivery).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空では保存できない' do
        @purchase_delivery.postal_code = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号が「3桁ハイフン4桁」の半角文字列でないと保存できない' do
        @purchase_delivery.postal_code = '1234567'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end

      it '都道府県が1では保存できない' do
        @purchase_delivery.prefecture_id = 1
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it '市区町村が空では保存できない' do
        @purchase_delivery.city = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では保存できない' do
        @purchase_delivery.address = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空では保存できない' do
        @purchase_delivery.phone_number = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が10桁未満では保存できない' do
        @purchase_delivery.phone_number = '090123456'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Phone number is too short")
      end

      it '電話番号が12桁以上では保存できない' do
        @purchase_delivery.phone_number = '090123456789'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Phone number is invalid. Input only number")
      end

      it '電話番号がハイフンを含むと保存できない' do
        @purchase_delivery.phone_number = '090-1234-5678'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Phone number is invalid. Input only number")
      end

      it 'トークンが空では保存できない' do
        @purchase_delivery.token = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      it 'image,price,item_name,description,category_id,item_condition_id,shipping_fee_payer_id,
      prefecture_id,days_to_ship_idが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'priceが空では登録できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'item_nameが空では登録できないこと' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'descriptionが空では登録できないこと' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'categoryが選択されていないと登録できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態が選択されていないと登録できないこと' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end

      it '配送料の負担者が選択されていないと登録できないこと' do
        @item.shipping_fee_payer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee payer can't be blank")
      end

      it '発送元の地域が選択されていないと登録できないこと' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送までの日数が選択されていないと登録できないこと' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end

      it 'priceが半角数字ではない場合登録できないこと' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end

      it 'priceが300だと保存できること' do
        @item.price = 300
        expect(@item).to be_valid
      end

      it 'priceが9999999だと保存できること' do
        @item.price = 9_999_999
        expect(@item).to be_valid
      end

      it 'priceが299以下だと登録できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end

      it 'priceが10000000以上だと登録できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end

      it 'userが紐付いていない場合は登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it 'priceが小数点を含む場合は登録できない' do
        @item.price = 300.5
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
    end
  end
end

require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.create(:item)
    sleep 0.1
  end
  describe '商品新規出品' do
    context '新規出品できるとき' do
      it '全ての情報が正しく入力されている場合、登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規登録できないとき' do
      it '商品画像が空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it '商品名が空だと登録できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Product name can't be blank"
      end

      it '商品の説明が空だと登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end

      it 'カテゴリーが選択されてないと登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it '商品の状態が選択されてないと登録できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end

      it '配送料の負担が選択されてないと登録できない' do
        @item.postage_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Postage can't be blank"
      end

      it '発送元の地域が選択されてないと登録できない' do
        @item.shipment_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipment can't be blank"
      end

      it '発送までの日数が選択されてないと登録できない' do
        @item.estimated_shipping_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Estimated shipping can't be blank"
      end

      it '価格が空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it '価格が1~299だと登録できない' do
        @item.price = rand(1..299)
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end

      it '価格が9,999,999を超えると登録できない' do
        @item.price = rand(10_000_000..99_999_999)
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than or equal to 9999999'
      end

      it '価格が全角だと登録できない' do
        @item.price = '３５１'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
    end
  end
end

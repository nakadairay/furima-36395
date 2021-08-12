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
        @item.images = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "画像を入力してください"
      end

      it '商品名が空だと登録できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品名を入力してください"
      end

      it '商品の説明が空だと登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の説明を入力してください"
      end

      it 'カテゴリーが選択されてないと登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "カテゴリーを入力してください", "カテゴリーは数値で入力してください"
      end

      it 'カテゴリーが--(id1)を選択してると登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "カテゴリーを選んでください"
      end

      it '商品の状態が選択されてないと登録できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の状態を入力してください", "商品の状態は数値で入力してください"
      end

      it '商品の状態が--(id1)を選択してると登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の状態を選んでください"
      end

      it '配送料の負担が選択されてないと登録できない' do
        @item.postage_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "配送料の負担を入力してください", "配送料の負担は数値で入力してください"
      end

      it '配送料の負担が--(id1)を選択してると登録できない' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "配送料の負担を選んでください"
      end

      it '発送元の地域が選択されてないと登録できない' do
        @item.shipment_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "発送元の地域を入力してください", "発送元の地域は数値で入力してください"
      end

      it '発送元の地域が--(id1)を選択してると登録できない' do
        @item.shipment_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "発送元の地域を選んでください"
      end

      it '発送までの日数が選択されてないと登録できない' do
        @item.estimated_shipping_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "発送までの日数を入力してください", "発送までの日数は数値で入力してください"
      end

      it '発送までの日数ーが--(id1)を選択してると登録できない' do
        @item.estimated_shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "発送までの日数を選んでください"
      end

      it '価格が空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "値段を入力してください"
      end

      it '価格が1~299だと登録できない' do
        @item.price = rand(1..299)
        @item.valid?
        expect(@item.errors.full_messages).to include '値段は300以上の値にしてください'
      end

      it '価格が9,999,999を超えると登録できない' do
        @item.price = rand(10_000_000..99_999_999)
        @item.valid?
        expect(@item.errors.full_messages).to include '値段は9999999以下の値にしてください'
      end

      it '価格が全角だと登録できない' do
        @item.price = '３５１'
        @item.valid?
        expect(@item.errors.full_messages).to include '値段は数値で入力してください'
      end

      it '価格が半角英数字混合では登録できない' do
        @item.price = '123abc'
        @item.valid?
        expect(@item.errors.full_messages).to include '値段は数値で入力してください'
      end

      it 'userが紐付いていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'ユーザーを入力してください'
      end
    end
  end
end

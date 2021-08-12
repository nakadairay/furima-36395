require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '新規購入情報入力' do
    context '入力問題ない場合' do
      it '全ての情報が正しく入力されている場合、保存できる' do
        expect(@order_address).to be_valid
      end

      it '建物欄は空欄でも登録できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end
    context '入力問題があるとき' do
      it 'user_idが空だと登録できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Userを入力してください"
      end

      it 'item_idが空だと登録できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Itemを入力してください"
      end

      it 'クレジットカード情報(token)が空だと登録できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "カード情報を入力してください"
      end

      it '郵便番号が空だと登録できない' do
        @order_address.postcode = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "郵便番号を入力してください"
      end

      it '郵便番号は、「3桁ハイフン4桁」の半角文字でないと登録できない' do
        @order_address.postcode = '9920035'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "郵便番号は不正な値です"
      end

      it '都道府県が選択されてないと登録できない' do
        @order_address.shipment_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "都道府県を入力してください", "都道府県は数値で入力してください"
      end

      it '都道府県が--(id1)を選択してると登録できない' do
        @order_address.shipment_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "都道府県を選んでください"
      end

      it '市区町村が空だと登録できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "市区町村を入力してください"
      end

      it '番地が空だと登録できない' do
        @order_address.block = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "番地を入力してください"
      end

      it '電話番号が空だと登録できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "電話番号を入力してください"
      end

      it '電話番号に「-」が含まれていると登録できない' do
        @order_address.phone_number = '080-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "電話番号は不正な値です"
      end

      it '電話番号は半角数字でないと登録できない' do
        @order_address.phone_number = '０８０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "電話番号は不正な値です"
      end

      it '電話番号が10桁未満だと登録できない' do
        @order_address.phone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "電話番号は不正な値です"
      end

      it '電話番号が12桁以上だと登録できない' do
        @order_address.phone_number = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "電話番号は不正な値です"
      end

      it '電話番号は英数混合だと登録できない' do
        @order_address.phone_number = '0801234abcd'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "電話番号は不正な値です"
      end

    end
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての情報が正しく入力されている場合、登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "ニックネームを入力してください"
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Eメールを入力してください"
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Eメールはすでに存在します"
      end

      it 'emailに@が含まれてないと登録できない' do
        @user.email = 'testdesu'
        @user.valid?
        expect(@user.errors.full_messages).to include "Eメールは不正な値です"
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードを入力してください"
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
      end

      it 'passwordとpassword_confirmationが一致しなければ登録できない' do
        @user.password = '1234yo'
        @user.password_confirmation = '5678yo'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '123yo'
        @user.password_confirmation = '123yo'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは6文字以上で入力してください"
      end

      it 'passwordが半角数字のみの場合は登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは不正な値です"
      end

      it 'passwordが半角英語のみの場合は登録できない' do
        @user.password = 'testdesu'
        @user.password_confirmation = 'testdesu'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは不正な値です"
      end

      it 'passwordが全角の場合は登録できない' do
        @user.password = 'ＴＥＳＴ１２３４'
        @user.password_confirmation = 'ＴＥＳＴ１２３４'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは不正な値です"
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "名前を入力してください"
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "苗字を入力してください"
      end

      it 'last_nameが半角では登録できない' do
        @user.last_name = 'suzuki'
        @user.valid?
        expect(@user.errors.full_messages).to include "名前は不正な値です"
      end
      it 'first_nameが半角では登録できない' do
        @user.first_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include "苗字は不正な値です"
      end

      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "名前（全角カナ）を入力してください"
      end

      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "苗字（全角カナ）を入力してください"
      end

      it 'last_name_kanaが半角では登録できない' do
        @user.last_name_kana = 'ｽｽﾞｷ'
        @user.valid?
        expect(@user.errors.full_messages).to include "名前（全角カナ）は不正な値です"
      end

      it 'first_name_kanaが半角では登録できない' do
        @user.first_name_kana = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include "苗字（全角カナ）は不正な値です"
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "生年月日を入力してください"
      end
    end
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nickname,email,password,password_confirmation,family_name,last_name,
      family_name_kana,last_name_kana,birthdayが存在すれば登録ができる' do
        expect(@user).to be_valid
      end
      it 'emailが重複していなければ登録ができる' do
        @user.save
        another_user = FactoryBot.build(:user)
        expect(another_user).to be_valid
      end
      it 'emailに@が含まれていれば登録ができる' do
        expect(@user.email).to include('@')
        expect(@user).to be_valid
      end
      it 'passwordが６文字以上であれば登録ができる' do
        @user.password = '1234ri'
        @user.password_confirmation = '1234ri'
        expect(@user).to be_valid
      end
      it 'passwordが半角英数字混合であれば登録ができる' do
        @user.password = '1234ri'
        @user.password_confirmation = '1234ri'
        expect(@user).to be_valid
      end

      it 'family_nameが全角入力であれば登録ができる' do
        @user.family_name = 'ぜんかく'
        expect(@user).to be_valid
      end

      it 'last_nameが全角入力であれば登録ができる' do
        @user.last_name = 'ぜんかく'
        expect(@user).to be_valid
      end

      it 'family_name_kanaが全角カタカナ入力であれば登録ができる' do
        @user.family_name_kana = 'ゼンカクカナ'
        expect(@user).to be_valid
      end

      it 'last_name_kanaが全角カタカナ入力であれば登録ができる' do
        @user.last_name_kana = 'ゼンカクカナ'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameカラムが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録ができない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailは@を含まなければ登録できない' do
        @user.email = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'emailは重複する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録ができない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが５文字以下では登録できない' do
        @user.password = '1234r'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは数字のみなら登録ができない' do
        @user.password = '1111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordは英字のみなら登録ができない' do
        @user.password = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordは全角なら登録ができない' do
        @user.password = '１２３４５６７'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'family_nameが空では登録ができない' do
        @user.family_name = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'family_nameは全角でないなら登録ができない' do
        @user.family_name = 'ｶｶ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end
      it 'last_nameが空では登録ができない' do
        @user.last_name = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameは全角でないなら登録ができない' do
        @user.last_name = 'ｶｶ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'family_name_kanaが空では登録ができない' do
        @user.family_name_kana = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it 'family_name_kanaは全角カタカナでないなら登録ができない' do
        @user.family_name_kana = 'ほげ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid')
      end
      it 'last_name_kanaが空では登録ができない' do
        @user.last_name_kana = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'last_name_kanaは全角カタカナでないなら登録ができない' do
        @user.last_name_kana = 'ほげ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
      it 'birthdayが空では登録ができない' do
        @user.birthday = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end

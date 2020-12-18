require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @user_order = FactoryBot.build(:user_order)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it 'post_number,prefecture_id,city,city_number,phone_number,order_id,tokenが存在すれば登録ができる' do
        expect(@user_order).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'post_numberが存在しなければ登録ができない' do
        @user_order.post_number = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to
        include "Post number can't be blank", 'Post number is invalid. Include hyphen(-)'
      end

      it 'post_numberがハイフンを含んだ正しい形でない' do
        @user_order.post_number = '1234567'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Post number is invalid. Include hyphen(-)')
      end

      it 'prefecture_idが1では登録ができない' do
        @user_order.prefecture_id = 1
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'cityが存在しなければ登録ができない' do
        @user_order.city = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("City can't be blank")
      end

      it 'city_numberが存在しなければ登録ができない' do
        @user_order.city_number = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("City number can't be blank")
      end

      it 'phone_numberが存在しなければ登録ができない' do
        @user_order.phone_number = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include "Phone number can't be blank", 'Phone number is invalid.'
      end

      it 'phone_numberが11桁以内でなければ登録ができない' do
        @user_order.phone_number = 123_456_789_000
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone number is invalid.')
      end

      it 'tokenが空だと登録ができない' do
        @user_order.token = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end

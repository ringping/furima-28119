require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end

  describe '商品購入時の住所登録' do
    context '商品出品がうまくいくとき' do
      it 'post_number,prefecture_id,city,city_number,building,phone_numberが存在すれば登録ができる' do
        expect(@address).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'post_numberが存在しなければ登録ができない' do
        @address.post_number = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Post_number can't be blank")
      end
    end
  end
end

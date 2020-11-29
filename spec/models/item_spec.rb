require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品がうまくいくとき' do
    context '商品出品がうまくいくとき' do
      it 'name,introduce,category_id,status_id,shipping_id,send_address_id,day_id,priceが存在すれば登録ができる' do
        expect(@item).to be_valid
      end
      it 'priceが300~9999999の間の価格ならば登録ができる' do
        @item.price = '400'
        expect(@item).to be_valid
      end
      it 'priceが半角数字であれば登録ができる' do
        @item.price = '400'
        expect(@item).to be_valid
      end
    end

    context '商品の出品ががうまくいかないとき' do
      it 'nameカラムが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'introduceが空では登録ができない' do
        @item.introduce = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduce can't be blank")
      end
      it 'category_idが1では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'status_idが1では登録できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end
      it 'shipping_idが1では登録できない' do
        @item.shipping_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping must be other than 1')
      end
      it 'send_address_idが1では登録できない' do
        @item.send_address_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Send address must be other than 1')
      end
      it 'day_idが1では登録できない' do
        @item.day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Day must be other than 1')
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank",
                                                      'Price is not included in the list', 'Price is invalid')
      end
      it 'priceが300〜9,999,999の間の数値でなければ登録できない' do
        @item.price = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが全角数字では登録できない' do
        @item.price = '３３３'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
    end
  end
end

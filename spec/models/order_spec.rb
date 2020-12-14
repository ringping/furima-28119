require 'rails_helper'

#RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '商品購入機能' do
    context '商品の購入がうまくいくとき' do
      it 'item_id,user_idが存在すれば登録ができる' do
        expect(@order).to be_valid
      end
    end

    context '商品の出品がうまくいかないとき' do
      it 'item_idが空では登録ができない' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item_id can't be blank")
      end

      it 'user_idが空では登録ができない' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User_id can't be blank")
      end
    end
  end
#end

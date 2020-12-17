class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_root, only: [:index, :create]
  before_action :set_item, only: [:index, :create, :pay_item, :move_to_root]
  def index
    @user_order = UserOrder.new
  end

  def create
    @user_order = UserOrder.new(user_order_params)
    if @user_order.valid?
      pay_item
      @user_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def user_order_params
    params.require(:user_order).permit(:post_number, :city, :city_number,
                                       :phone_number, :order_id, :building, :prefecture_id).merge(item_id: @item.id, user_id: current_user.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: user_order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def move_to_root
    if order = Item.find(params[:item_id]).order
      order.item_id.present?
      redirect_to root_path
    elsif item = Item.find(params[:item_id])
      current_user.id == item.user_id
      redirect_to root_path
    end
  end
end

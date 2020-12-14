class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_root, only:[:index, :create]
 def index
  @item = Item.find(params[:item_id])
  @user_order = UserOrder.new
 end

 def create
  binding.pry
  @item = Item.find(params[:item_id])
  @user_order = UserOrder.new(user_order_params)
  if @user_order.valid?
    @user_order.save
    redirect_to root_path
  else
    render action: :index
  end

 end

 private
  def user_order_params
    params.require(:user_order).permit(:post_number, :city, :city_number, :phone_number, :order, :prefecture_id,).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def move_to_root
    redirect_to root_path if current_user.id == @item.user_id || @item = nil
  end

end

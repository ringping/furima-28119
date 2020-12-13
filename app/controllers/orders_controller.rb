class OrdersController < ApplicationController
 def index
  @item = Item.find(params[:item_id])
  @user_order = UserOrder.new
 end

 def create
  binding.pry
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
    params.require(:user_order).permit(:post_number, :city, :city_number, :phone_number, :order, :prefecture_id, :item_id, :user_id)
  end

end

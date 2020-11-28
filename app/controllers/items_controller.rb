class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name,
    :intoduce, :category_id, :status_id, :shipping_id, :send_address_id, :day_id, :price, :user_id, :image)
  end
end

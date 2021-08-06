class OrdersController < ApplicationController

  def index
    @items = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create

  end
end

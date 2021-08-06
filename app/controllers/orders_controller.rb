class OrdersController < ApplicationController

  def index
    @items = Item.find(params[:item_id])
  end

  def new

  end

  def create

  end
end

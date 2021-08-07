class OrdersController < ApplicationController
  def index
    @items = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @items = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postcode, :shipment_id, :city, :block, :building, :phone_number).merge(
      item_id: params[:item_id], user_id: current_user.id
    )
  end
end

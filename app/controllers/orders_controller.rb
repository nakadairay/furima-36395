class OrdersController < ApplicationController
  before_action :set_items
  before_action :authenticate_user!
  before_action :not_user_move_index
  before_action :sold_out_item

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @items.price,
        card: order_params[:token],
        currency: 'jpy'
      )
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postcode, :shipment_id, :city, :block, :building, :phone_number).merge(
      item_id: params[:item_id], user_id: current_user.id, token: params[:token]
    )
  end

  def set_items
    @items = Item.find(params[:item_id])
  end

  def not_user_move_index
    redirect_to root_path if current_user.id == @items.user_id
  end

  def sold_out_item
    redirect_to root_path if @items.order.present?
  end
end

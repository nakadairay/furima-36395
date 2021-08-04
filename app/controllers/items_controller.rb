class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :price, :description, :category_id, :postage_id, :status_id, :shipment_id,
                                 :estimated_shipping_id).merge(user_id: current_user.id)
  end
end

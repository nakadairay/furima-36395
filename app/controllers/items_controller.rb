class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :not_user_move_index, only: [:edit, :update, :destroy]
  before_action :sold_out_item, except: [:index, :show, :new, :create]

  def index
    @item = Item.order('created_at DESC')
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render action: :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :price, :description, :category_id, :postage_id, :status_id, :shipment_id,
                                 :estimated_shipping_id, images: []).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def not_user_move_index
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def sold_out_item
    redirect_to root_path if @item.order.present?
  end
end

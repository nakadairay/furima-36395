class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update]
  before_action :not_user_move_index, only: [:edit, :update]
  before_action :authenticate_user!, except: [:index, :show]

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

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :price, :description, :category_id, :postage_id, :status_id, :shipment_id,
                                 :estimated_shipping_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def not_user_move_index
    redirect_to root_path unless current_user.id == @item.user_id
  end
end

class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :user_status, only: [:edit, :update]
  def index
    @items = Item.order("created_at DESC")
    @item_number = Item.count
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    if @item.destroy
      redirect_to items_path
    else
      redirect_to item_path
    end

  end
  private

  def item_params
    params.require(:item).permit(
      :image,
      :item_name,
      :explanation,
      :category_id,
      :status_id,
      :delivery_fee_id,
      :shipping_area_id,
      :days_to_ship_id,
      :price,
      :user
    ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def user_status
    unless @item.user_id == current_user.id
      redirect_to root_path
    end
  end
end

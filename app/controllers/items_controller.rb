class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to item_path
    else
      render :edit
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
end

class ItemsController < ApplicationController

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
    )
    
  end
end

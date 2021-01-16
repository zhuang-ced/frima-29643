class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :explanation, :category_id, :status_id, :delivery_fee_id, :shipping_area_id, :days_to_ship_id, :price, :user)
    
  end
end

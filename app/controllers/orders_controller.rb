class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end


  def create
    @order_address = OrderAddress.new(address_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def address_params
    params.require(:order_address).permit(:post_number, :shipping_area_id, :city, :house_number, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item =  Item.find(params[:item_id])
  end

end

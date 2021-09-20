class PurchaseHistoriesController < ApplicationController
  attr_accessor
  
  def index
    @ship = Ship.new #TODO// refactoring?
  end

  def create
    @ship = Ship.new(ship_params)
    if
    else
    end
  end

  private

  def ship_params
    params.require(:ship).permit(:zipcode, :state_id, :locality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item.id])
  end

  def shop_item
    @item = Item.find(params[:id])
  end
end

#model作らな！

class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :shop_item, only: [:index, :create]
  before_action :def_not_allowed_url, only: [:index, :create]

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

  def not_allowed_url
    if @item.user_id != current_user.id || @item.purchase_history !=nil
      redirect_to root_path
    end
  end
end

#migrateせな!


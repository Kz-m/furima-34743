class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :shop_item, only: [:index, :create]
  #before_action :not_allowed_url, only: [:index, :create]

  def index #allow @item for private method
    @ship = Ship.new #TODO// refactoring?
  end

  def create
    @ship = Ship.new(ship_params)
    if @ship.valid?
      @ship.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def ship_params
    params.require(:ship).permit(:zipcode, :state_id, :locality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def shop_item
    @item = Item.find(params[:item_id]) #item_purchase_historiesのURLがネストにより変化している
  end

  #def not_allowed_url
  #  if @item.user_id != current_user.id || @item.purchase_history !=nil
  #    redirect_to root_path
  #  end
  #end
end


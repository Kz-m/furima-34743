class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  #before_action :shop_item, only: [:edit, :update, :show, :destroy]

  def index 
    @items = Item.all.order("created_at DESC")
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

  #def show
  #end

  #def edit
  #end

  #def update
  #  if @item.save
  #    redirect_to item_path
  #  end
  #end

  #def destroy
  #  if current_user.id == @item.user_id
  #    @item.destroy
  #  end
  # redirect_to root_path
    
  #end


  private

  def item_params
    params.permit(:image, :name, :description, :category_id, :status_id, :prefecture_id, :shipping_fee_id, :shipping_day_id,
                  :price).merge(user_id: current_user.id)
  end

  #def shop_item
  #  @item = Item.find(params[:id])
  #end

end
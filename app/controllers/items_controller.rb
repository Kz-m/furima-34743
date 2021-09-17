class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :shop_item, only: [:show, :destroy]

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

  def show
  end

  #def edit
  #end

  #def update
  #  if @item.save
  #    redirect_to item_path
  #  end
  #end
  
  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def item_params
    params.permit(:image, :name, :description, :category_id, :status_id, :prefecture_id, :shipping_fee_id, :shipping_day_id,
                  :price).merge(user_id: current_user.id)
  end

  def shop_item
    @item = Item.find(params[:id])
  end

end

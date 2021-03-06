class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :shop_item, only: [:show, :edit, :update, :destroy]
  before_action :not_allowed_url, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
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
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :prefecture_id, :shipping_fee_id, :shipping_day_id,
                                 :price).merge(user_id: current_user.id)
  end

  def shop_item
    @item = Item.find(params[:id])
  end

  def not_allowed_url
    redirect_to root_path if @item.user_id != current_user.id || !@item.purchase_history.nil?
  end
end

class ItemsController < ApplicationController
  
  def index
    @item = Item.new 
  end 

  def create
    @item = Item.new(item.params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end 

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :prefecture_id, :shipping_id, :shippng_day, :price)#.merge(user_id: current_user.id) //TODO think should i put "merge"
  end

end

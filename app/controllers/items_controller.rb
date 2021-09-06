class ItemsController < ApplicationController
  
  def index
    @item = Item.new #?
  end 

  private

  #def item_params
  #  params.require(:item).permit(:image).merge(user_id: current_user.id) #TODO// lemme check item_params
  #end

end

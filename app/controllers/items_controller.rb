class ItemsController < ApplicationController
  
  def show
  end 

  private

  def item_params
    params.require(:item).permit(:image).merge(user_id: current_user.id) #TODO// lemme check item_params
  end

end

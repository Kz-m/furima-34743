class PurchaseForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zipcode, :state_id, :locality, :address, :building_name, :phone_number#, :token 
  #TODO// put validates
  def save
    #TODO// save methods for each tables
  end
end

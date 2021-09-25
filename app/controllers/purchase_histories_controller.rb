class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :shop_item, only: [:index, :create]
  #before_action :not_allowed_url, only: [:index, :create]

  def index #allow @item for private method
    @purchase_form = PurchaseForm.new
  end

  def create
    @purchase_form = PurchaseForm.new(form_params)
    if @purchase_form.valid?
      purchase_item
      @purchase_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def form_params
    params.require(:purchase_form).permit(:item_id, :zipcode, :prefecture_id, :locality, :address, :building_name, :phone_number)
    .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def shop_item
    @item = Item.find(params[:item_id]) #item_purchase_historiesのURLがネストにより変化
  end

  def purchase_item
    Payjp.api_key = ENV["FRMAPP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: form_params[:token],
      currency: 'jpy'
    )
  end

  #def not_allowed_url
  #  if @item.user_id == current_user.id || @item.purchase_history !=nil
  #    redirect_to root_path
  #  end
  #end
end


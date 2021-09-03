class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def show
  end

  def create
    @user = User.find(params[:id])
    if @user.save
      redirect_to action: :index
    else
      render :new #top page
    end
  end


end

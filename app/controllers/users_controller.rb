class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def show
  end

  def create
    @user = User.find(params[:id])#(user_paramas) TODO// later
    if @user.save
      redirect_to action: :index
    else
      render :new
    end
  end

  private
  def #user_params
  end

end

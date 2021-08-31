class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    #@user.valid?
    #@user.errors.any?
  end

  def show
  end

  def create
    @user = User.new#(user_paramas) TODO// 後で
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

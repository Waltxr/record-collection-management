class UsersController < ApplicationController
  # before_action :require_login


  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  # def require_login
  #  return head(:forbidden) unless session.include? :user_id
  # end

end

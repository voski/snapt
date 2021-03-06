class UsersController < ApplicationController
  before_action :require_signed_out!

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in(@user)
      redirect_to root_url anchor: "users/#{@user.id}"
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:username, :password, :email, :private)
  end
end

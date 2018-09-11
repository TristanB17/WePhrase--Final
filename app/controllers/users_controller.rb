class UsersController < ApplicationController
  def create
    @user = User.create(user_params)
    if @user
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:provider, :name, :uid, :oauth_token, :oauth_expires_at)
  end
end

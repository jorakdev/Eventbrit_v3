class AvatarsController < ApplicationController
  def create
    @user = User.find(params[:format])
    @user.avatar.attach(params[:avatar])
    redirect_to(user_path(@user))
  end
end

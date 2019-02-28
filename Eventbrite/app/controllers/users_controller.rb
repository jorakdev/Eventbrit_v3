class UsersController < ApplicationController

  def index
  end
  def show
    @current_user =  User.find(current_user.id)
    @event = Event.where(user_id: current_user.id)
  end

  def edit
    @current_user = User.find(current_user.id)
  end

  def update
    @current_user = User.find(current_user.id)
    user_params =  params.require(:user).permit(:first_name, :last_name, :description)
    @current_user.update(user_params)
    redirect_to user_path(current_user.id)
  end
end

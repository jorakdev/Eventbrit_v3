class EventController < ApplicationController
  before_action :authenticate_user!

  def index
    @all_e = Event.all
  end

  def new
    @e = Event.new
  end

  def create
    @user = User.find(current_user.id)
    @id_current_user = current_user.id
    event = Event.create(title: params[:title], description: params[:description], location: params[:location], start_date: params[:start_date], duration: params[:duration], price: params[:price], user_id: @id_current_user)
    @user.events << event
    @user.save
    redirect_to event_index_path
end

  def show
    @all_u = User.all
    @event_id = params[:id].to_i
    @@event_id_to = @event_id
    @all_e = Event.all
    @attendance = Attendance.all
  end

  # private
  # def authenticate_user
  #   unless current_user
  #     flash[:danger] = "Please log in."
  #     redirect_to root_path
  #   end
  # end
end

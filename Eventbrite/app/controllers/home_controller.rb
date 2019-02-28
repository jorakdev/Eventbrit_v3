class HomeController < ApplicationController

  before_action :authenticate_user!, only: [:secret]

  def index
    #redirect_to event_index_path
  end

  def secret
  end
end

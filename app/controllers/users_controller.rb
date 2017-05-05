class UsersController < ApplicationController
before_action :authorize_user, only: [:edit, :update, :show]

  def index
    @users = User.all
    @weather = Weather.new(@hour, @temp, @condition, @wspd, @humidity, @snow)
    url = 'http://api.wunderground.com/api/ce0783e06625adc3/hourly/q/MA/Boston.json'
    data = JSON.parse(open(url).read)
    binding.pry
  end

  def show
    @user = User.find(params[:id])
  end

  def authorize_user
    if !user_signed_in?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end

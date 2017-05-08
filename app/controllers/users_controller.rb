class UsersController < ApplicationController
before_action :authorize_user, only: [:edit, :update, :show]

  def index; end

  def show
    @user = User.find(params[:id])
    user_locations = UsersLocation.where(user: @user)
    ul = user_locations.pluck(:location_id)
    @location = Location.where(id: ul).last
  end

  def new
    @user = current_user
    user_locations = UsersLocation.where(user: @user)
    ul = user_locations.pluck(:location_id)
    @location = Location.where(id: ul).last
    @weather = Weather.new(@temp, @condition, @wspd, @humidity, @snow, @location)
    @message = Message.new(@weather)
  end

  def authorize_user
    if !user_signed_in?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end

class UsersController < ApplicationController
before_action :authorize_user, only: [:edit, :update, :show]

  def index
    @users = User.all
    @weather = Weather.new(@temp, @condition, @wspd, @humidity, @snow)
    @message = Message.new(@weather)
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

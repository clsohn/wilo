class UsersController < ApplicationController
before_action :authorize_user, only: [:edit, :update, :show]

  def index
    @users = User.all
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

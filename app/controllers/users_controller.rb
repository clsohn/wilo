class UsersController < ApplicationController
before_action :authorize_user, only: [:edit, :update, :show]

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end
end

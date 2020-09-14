class UsersController < ApplicationController
  def index
    @users_index = User.all
  end

  def show
    @users_show = User.find(params[:id])
  end
end

class UsersController < ApplicationController
  def index
    @users_index = User.all
  end

  def show
  end
end

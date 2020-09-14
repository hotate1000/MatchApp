class UsersController < ApplicationController
  before_action :login_in_user


  def index
    # @user_index = User.where(nickname: "犬３")
    # @users_index = User.all
    if (current_user[:sex] == 1)
      @users_index = User.where(sex: 0)
      # @users_index = User.all
    elsif (current_user[:sex] == 0)
      @users_index = User.where(sex: 1)
      # @users_index = User.all
    else
      @users_index = User.all
    end
  end

  def show
    @users_show = User.find(params[:id])
  end
end

  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end


private
def login_in_user
  unless user_signed_in?
    # flash[:alert] = "ログインしてください"
    redirect_to new_user_session_path
  end
end
class RelationshipsController < ApplicationController

  # def create
  #   current_user.active_relationships.create(create_params)
  # end

  # private

  # def create_params
  #   params.permit(:following_id)
  # end

  def create
    @user = User.find(params[:relationship][:following_id])
    current_user.follow!(@user)
    redirect_to @user
  end

  def destroy
    @user = Relationship.find(params[:id]).following
    current_user.unfollow!(@user)
    redirect_to @user
  end

end

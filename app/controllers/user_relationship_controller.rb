class UserRelationshipController < ApplicationController
  def create
    @user_relationship = UserRelationship.new(follower_id: params[:follower_id], following_id: params[:following_id])
    if @user_relationship.save
      redirect_to users_path
    end
  end

  def destroy
    if @user_relationship = UserRelationship.find(params[:relationship_id])
    UserRelationship.destroy(params[:relationship_id])
    redirect_to users_path
    end
  end
end

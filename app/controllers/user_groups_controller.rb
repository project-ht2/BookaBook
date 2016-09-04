class UserGroupsController < ApplicationController
  def show
    @group = UserGroup.find(params[:id])
  end
end

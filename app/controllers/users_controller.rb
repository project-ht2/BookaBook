class UsersController < ApplicationController
  def show
  end

  def index
    @users = User.all_except current_user
  end
end

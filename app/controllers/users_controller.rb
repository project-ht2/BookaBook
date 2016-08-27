class UsersController < ApplicationController
   before_action :set_small_book_block, only: [:show]
   before_action :set_user, only: [:show]
  
  def show
    @page_owner = current_user == @user
  end

  def index
    @users = User.all_except(current_user).search(params[:q_user])
  end
  
private

  def set_user
    @user = User.find(params[:id])
  end
end

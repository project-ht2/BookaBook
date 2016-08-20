class UsersController < ApplicationController
   before_action :set_small_book_block, only: [:show]
  
  def show
  end

  def index
    @users = User.all_except current_user
  end
end

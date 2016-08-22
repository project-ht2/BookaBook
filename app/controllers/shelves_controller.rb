class ShelvesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shelf, only: [:new]
  
  def new
  end

  def create
  	@shelf = Shelf.new shelf_params
  	if @shelf.save
  		flash[:success] = "Shelf created!"
  		redirect_to user_path(current_user)
  	else
  		flash[:error] = @shelf.errors.full_messages.to_sentence
  		render 'new'
  	end
  end

  def show
	  render 'users/show'
  end

  private
    def shelf_params
    	params.require(:shelf).permit(:name, :description, :user_id)
    end
    
    def set_shelf
      @shelf = current_user.shelves.new
    end
end

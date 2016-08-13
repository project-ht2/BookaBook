class ShelvesController < ApplicationController
  def new
  	@shelf = Shelf.new
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
end

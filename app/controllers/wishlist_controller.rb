class WishlistController < ApplicationController
  def create
    @wishlist = Wishlist.new(wishlist_params)
    
    if @wishlist.save!
      flash[:success] = "A wishlist is created for this book"
    else 
      flash[:error] = "Something wrong"
    end
    
    redirect_to :back
  end

  def destroy
    @wishlist = Wishlist.find(params[:id])
    
    if @wishlist.destroy 
      flash[:success] = "Your wishlist is removed"
    else
      flash[:error] = "Cannot remove this wishlist"
    end
    
    redirect_to :back
  end
  
  private
    def wishlist_params
      params.require(:wishlist).permit(:user_id, :book_id)
    end
end

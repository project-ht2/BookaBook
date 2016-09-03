class UserCategoriesController < ApplicationController
  def index
    @categories = UserCategory.all
  end

  def show
    
  end
end

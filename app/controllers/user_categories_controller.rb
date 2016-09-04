class UserCategoriesController < ApplicationController
  def index
    @categories = UserCategory.all
  end

  def show
    @category = UserCategory.find(params[:id])
  end
end

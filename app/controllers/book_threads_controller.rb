class BookThreadsController < ApplicationController
  def show
    @post = ThreadPost.new
    @thread = BookThread.find(params[:id])
  end
end

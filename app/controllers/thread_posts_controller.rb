class ThreadPostsController < ApplicationController
  def create
    @post = ThreadPost.new(post_params)
    if @post.save
      redirect_to BookThread.find(@post.thread_id)
    end
  end

  private
  def post_params
    params.require(:thread_post).permit(:content, :user_id, :thread_id)
  end
end

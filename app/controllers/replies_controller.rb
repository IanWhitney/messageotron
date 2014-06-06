class RepliesController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @reply = @post.replies.new
  end

  def create
    @post = Post.find(params[:post_id])
    @reply = @post.replies.new(reply_params)
    @reply.user = current_user
    if @reply.save
      redirect_to post_path(@reply.post)
    else
      render 'posts/show'
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:content)
  end
end

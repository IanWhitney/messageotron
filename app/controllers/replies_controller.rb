class RepliesController < ApplicationController
  def new
    @reply = Post.find(params[:post_id]).replies.new
  end

  def create
    @reply = Post.find(params[:post_id]).replies.create(reply_params)
    @reply.user = current_user
    if @reply.save
      redirect_to post_path(@reply.post)
    else
      render :new
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:content)
  end
end

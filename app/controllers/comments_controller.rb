class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = current_user.comments.create(post_id: params[:comment][:post_id], content: params[:comment][:content])
    if @comment.save
      redirect_to '/', notice: 'Added commented!'
    else
      flash[:danger] = 'Failed to add comment...'
      redirect_to '/'
    end
  end
end

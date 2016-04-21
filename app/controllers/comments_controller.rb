class CommentsController < ApplicationController
  def new

  end

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

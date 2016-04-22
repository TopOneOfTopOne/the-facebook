class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(post_id: params[:post_id])
    if @like.save
      redirect_to '/'
    else
      flash[:warning] = 'Failed to like post'
      redirect_to '/'
    end
  end

  def destroy
    @like = current_user.likes.find_by_id(params[:id])
    @like.destroy

    redirect_to '/'
  end
end

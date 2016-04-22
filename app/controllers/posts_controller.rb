class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(body: params[:post][:body])
    if @post.save
      redirect_to root_path, notice: "Posted"
    else
      flash[:danger] = "Post failed :("
      redirect_to root_path
    end
  end

  def destroy
    Post.find_by_id(params[:id]).destroy
    redirect_to '/', notice: "Destroyed :)"
  end
end

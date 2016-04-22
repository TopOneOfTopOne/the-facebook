class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.create(friend_id: params[:friend_id])
    if @friendship.save
      flash[:success] = "Added new friend"
      redirect_to "/profile/#{params[:friend_id]}"
    else
      flash[:warning] = "Failed to add friend"
      redirect_to "/profile/#{params[:friend_id]}"
    end
  end

  def destroy
    current_user.friendships.find_by(friend_id: params[:friend_id]).destroy
    redirect_to "/profile/#{params[:friend_id]}"
  end
end

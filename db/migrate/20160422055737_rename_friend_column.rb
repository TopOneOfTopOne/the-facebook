class RenameFriendColumn < ActiveRecord::Migration
  def change
    rename_column :friendships, :friend, :friend_id
  end
end

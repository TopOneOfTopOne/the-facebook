5.times do |_|
  user = User.create! do |user|
    user.name = Faker::Superhero.name
    user.email = Faker::Internet.email
    user.password = Devise.friendly_token
    user.image_link = Faker::Avatar.image
  end
end

# create 5 posts for each uesr
5.times do |_|
  User.all.each do |user|
    user.posts.create! do |post|
      post.body = Faker::Hipster.sentence
    end
  end
end


# all users comment on each post once
User.all.each do |user|
  Post.all.each do |post|
    user.comments.create(post_id: post.id) do |comment|
      comment.content = Faker::Hipster.sentence
    end
  end
end

# Every user befriend each other
User.all.each do |active_friend|
  User.all.each do |passive_friend|
    active_friend.friendships.create(friend_id: passive_friend.id) unless active_friend == passive_friend
  end
end

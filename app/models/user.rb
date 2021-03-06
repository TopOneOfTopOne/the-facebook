class User < ActiveRecord::Base
  after_create :send_welcome_email
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :inverse_friendships, foreign_key: 'friend_id', class_name: 'Friendship', dependent: :destroy
  has_many :inverse_friends, through: :inverse_friendships, source: :user
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.image_link = auth.info.image
      user.password = Devise.friendly_token
    end
  end

  def likes?(post)
    likes.each { |like| return like if post == like.post }
    false
  end
  def has_friend?(user)
    friends.each { |friend| return true if friend == user }
    false
  end

  def has_inverse_friend?(user)

  end

  def send_welcome_email
    Users.welcome_email(self).deliver_now
  end
end

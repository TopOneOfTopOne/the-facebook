class Post < ActiveRecord::Base
  default_scope -> { order(created_at: :DESC) } # this is executed each time the db is queried
  validates :body, presence: true, length: {maximum: 140}
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end

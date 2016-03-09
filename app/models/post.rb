class Post < ActiveRecord::Base
  belongs_to :user

  has_many :comments
  has_many :categories_posts
  has_many :categories, through: :categories_posts

  validates :content, presence: true, length: {minimum: 10}
end

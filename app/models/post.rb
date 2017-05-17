class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :message, length: { minimum: 15 }
end

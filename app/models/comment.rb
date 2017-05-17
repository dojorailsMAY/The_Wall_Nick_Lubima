class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  validates :message, length: { minimum: 15 }
end

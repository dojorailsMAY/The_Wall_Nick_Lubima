class User < ActiveRecord::Base
    has_many :posts
    has_many :comments
    validates :username, :password,  presence: true
    validates :username, length: { minimum: 3 }
    validates :password, length: { minimum: 8 }
end

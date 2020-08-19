class User < ApplicationRecord
    has_many :tweets
    has_many :likes
    has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
    has_many :followees, through: :followed_users
   
    has_many :following_users, foreign_key: :followee_id, class_name: 'Follow' 
    has_many :followers, through: :following_users
   
    validates :name, presence: true
    validates :password, length: { in: 6..15 }
    validates :handle, length: { in: 3..15 }
    validates :birthday, presence: true

    def twitter_handle
        new_handle = self.handle.split(" ").join
        "@#{new_handle}"
    end
    
  
    
    


end

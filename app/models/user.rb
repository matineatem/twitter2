class User < ApplicationRecord
    has_many :tweets
    has_many :likes
    

    def twitter_handle
        new_handle = self.handle.split(" ").join
        "@#{new_handle}"
    end
    
    def following
        @following=[]
    end
    
    
    def follow(user)
        @following << user
    end
    
    def followers
        User.find_all do |user|
            user.following.include?(self)
        end
    end
    
    


end

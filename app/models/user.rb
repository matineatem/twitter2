class User < ApplicationRecord
    has_many :tweets
    has_many :likes
    

    def twitter_handle
        new_handle = self.handle.split(" ").join
        "@#{new_handle}"
    end

    
end

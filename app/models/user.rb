class User < ApplicationRecord
    has_many :tweets
    has_many :likes
    
end

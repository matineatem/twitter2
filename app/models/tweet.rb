class Tweet < ApplicationRecord
    belongs_to :user
    has_many :likes


    def self.sorted_tweets
        Tweet.all.sort_by do |tweet|
            tweet.created_at
        end
    end

end

class Tweet < ApplicationRecord
    belongs_to :user
    has_many :likes
    validates :text, length: { in: 1..150 }

    def self.sorted_tweets
        Tweet.all.sort_by do |tweet|
            tweet.created_at
        end
    end

end

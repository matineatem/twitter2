class LikesController < ApplicationController
  def index
    
  end

  def new
    @like = Like.new
  end

  def create
    
    #params[:like][:user_id, :tweet_id]
    #   Like.create(user_id: .id, tweet_id: tweet.id)
    @like = Like.create(like_params)
  end


  private
  def like_params
    params.require(:like).permit(:user, :tweet)
  end
end

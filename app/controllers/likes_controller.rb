class LikesController < ApplicationController
  def index
    
  end

  def show
    
  end

  def new
    @like = Like.new
  end

  def create
    #params[:like][:user_id, :tweet_id]
    #   Like.create(user_id: .id, tweet_id: tweet.id)
    @user = session[:user]
    
    @like = Like.create(user_id: @user["id"], tweet_id: Tweet.find(params[:format]).id)
    #byebug

    #@like = Like.create(like_params)

  end


  private
  def like_params
    params.require(:like).permit(:user_id, :tweet_id)
  end
end

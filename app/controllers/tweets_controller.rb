class TweetsController < ApplicationController
  before_action :set_user_session
  def index
    @tweets = Tweet.all 
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    @tweet = Tweet.new
  end

  def create
    text = params[:tweet][:text]
    @tweet = Tweet.create(text: text,user_id: @username["id"])
    redirect_to tweets_path
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @user = @tweet.user 
    @tweet.destroy
    redirect_back(fallback_location:"/")
  end

  private

  def tweet_params
    params.require(:tweet).permit(:text)
  end

  def set_user_session
    @username = session[:user]
  end
  
end

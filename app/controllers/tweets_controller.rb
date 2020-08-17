class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all 
    @user = session[:user]
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @user = session[:user]
    text = params[:tweet][:text]

    @tweet = Tweet.create(text: text,user_id: @user["id"])
    redirect_to tweets_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:text)
  end
  
end

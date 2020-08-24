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

    if @tweet.valid?
      @tweet.save
      redirect_back(fallback_location:"/")
    else
      render :new
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @user = @tweet.user 
    @tweet.destroy
    redirect_back(fallback_location:"/")
  end

  def delete_this
    @tweet = Tweet.find(params[:id])
    @user = @tweet.user 
    @tweet.destroy
    redirect_to tweets_path
  end

  def trends
    @tweets =  Tweet.all
    @tweets.sample
  end

  private

  def tweet_params
    params.require(:tweet).permit(:text)
  end

  def set_user_session
    @username = session[:user]

    @current_user=User.find_by(id: @username['id'])
  end
  
end

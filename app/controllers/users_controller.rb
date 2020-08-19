class UsersController < ApplicationController

  before_action :set_user_session

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    byebug
  end

  def new
    @user = User.new
  end

  def create
  
    @user = User.create(user_params)
    session[:user] = @user

    if @user.valid?
      @user.save
    redirect_to tweets_path
    else
      render :new
    end

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    @user.tweets.clear
    redirect_to homepage_path
  end

  def followee
    @followees = @user.followees
  end

  def follower
    @followers = @user.followers
  end

  def follow
    Follow.create(follower_id: @user.id, followee_id: @username["id"])
    
    redirect_back(fallback_location:"/")
  end

  def unfollow
    @my_followers.delete(@user.id)
    redirect_back(fallback_location:"/")
    
  end

  private
  
  def user_params
    params.require(:user).permit(:name,:password,:handle,:bio,:birthday)
  end

  def set_user_session
    @username = session[:user]

    followees_objects = Follow.where(follower_id: @username["id"] )
     @im_following = followees_objects.map{ |followees| followees.followee_id}

    followers_objects = Follow.where(followee_id: @username["id"] )
    @my_followers = followers_objects.map{ |followers| followers.follower_id}
     

  end



end

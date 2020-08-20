class UsersController < ApplicationController

  before_action :set_user_session, except: [:new, :create]

  def index
    @users = User.all 
  end

  def show
    @user = User.find(params[:id])
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
    #@current_user.destroy
    #@current_user.tweets.clear
    


    @user = User.find(params[:id])
    # byebug
    @user.destroy
    # byebug
    @user.tweets.clear
    redirect_to homepage_path
  end

  def followees
    @user = User.find(params[:id])
    @followees = @user.followees.uniq
  end

  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.uniq
  end

  def follow
    #Follow.create(follower_id: @user.id, followee_id: @username["id"])
    @user = User.find(params[:id])
    # @im_following << @user
    #byebug
    @current_user.followees << @user
    @current_user.save
    redirect_back(fallback_location:"/")
  end

  def unfollow
    @user = User.find(params[:id])
    # @im_following.delete(@user.id)
    @current_user.followees.delete(@user)
    @current_user.save
    redirect_back(fallback_location:"/")
    
  end

  private
  
  def user_params
    params.require(:user).permit(:name,:password,:handle,:bio,:birthday)
  end

  def set_user_session
    @username = session[:user]

    @current_user=User.find_by(id: @username['id'])

  
    # followees_objects = Follow.where(follower_id: @username["id"] )
    #  @im_following = followees_objects.map{ |followees| followees.followee_id}

    # followers_objects = Follow.where(followee_id: @username["id"] )
    # @my_followers = followers_objects.map{ |followers| followers.follower_id}
     

  end



end




# 
# 





class UsersController < ApplicationController

  before_action :set_user_session

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
    redirect_to tweets_path
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

  private
  
  def user_params
    params.require(:user).permit(:name,:password,:handle,:bio,:birthday)
  end

  def set_user_session
    @username = session[:user]
  end

end

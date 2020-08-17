class SessionsController < ApplicationController
  def login
  end

  def process_login
  
    session[:user] = User.find_by(name: params[:name])
    @user = session[:user]
    
    if @user && @user.password == params[:password]
        redirect_to tweets_path
      else
        render :login
      end

  end
end


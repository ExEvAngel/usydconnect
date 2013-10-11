class UsersController < ApplicationController
  
  def create
    @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
    if @user.save
	  create_cookies(params[:username], params[:password])
      redirect_to root_path
    else
      redirect_to signup_path
    end
  end
  
  def new
    redirect_to root_path unless !is_logged_in?
    @user = User.new
  end
end

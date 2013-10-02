class StaticPagesController < ApplicationController
  
  def create
	if valid_login(params[:username], params[:password])
      password_hash = params[:password]
	  create_cookies(params[:username], params[:password])
	end
    redirect_to root_path
  end
  
  def destroy
  	sign_out
  	redirect_to root_path
  end
  
  def home
    @user = User.find(:all)
  end

  def help
  end

  def about
  end

  def policy
  end
end

class StaticPagesController < ApplicationController
  before_action :get_username
  
  def create
	if valid_login(params[:username], params[:password])
	  create_cookies(params[:username], params[:password])
	end
    redirect_to root_path
  end
  
  def destroy
  	sign_out
  	redirect_to root_path
  end
  
  def home
    @recent = Athread.last(3)
  end

  def help
  end

  def about
  end

  def policy
  end
  
  def results
    @threads = Athread.all
  end

  def follow
    @users = Follow_users.where(user_id: @u_id)

  end 
  
  	private
		def get_username
		  if is_logged_in?
		    @username = cookies.signed[:username]
		    @u_id = User.get_user_id(@username)
	      end
		end
		
end

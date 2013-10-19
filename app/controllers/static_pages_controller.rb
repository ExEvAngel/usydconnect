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
  
  	private
		def get_username
			@username = cookies.signed[:username]
		end
		
end

class UsersController < ApplicationController
  before_action :get_username
	
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
  end
  
  def profile
  	@u_id = User.get_user_id(@username)
    @user = User.where(id: @u_id)
	@email = @user[0].email
	@xp = @user[0].xp
  end
  
	private
	def get_username
	  @username = cookies.signed[:username]
	end
end
